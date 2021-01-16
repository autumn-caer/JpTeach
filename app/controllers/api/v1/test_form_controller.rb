class Api::V1::TestFormController < ApiController
  before_action :set_tesfForms, only: [:show, :update]
  before_action :text_check # この行を追加！

  include TestFormOptions

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    testForms = TestForm.all
    render json: testForms
  end

  def show
    results = Array.new
    testFormHeader = TestFormHeader.find(params[:id])
    # .select(:header_name,:test_type)

    @tesfForms.each do | testForm |

      #テスト選択肢を取得
      options = getTestFormOptions(testForm.id)

      #画面用配列に設定
      tmp = testForm.attributes
      #回答
      tmp[:options] = options

      #配列に入れる
      results.push(tmp)
    end

    rtnHash = {}
    rtnHash[:testFormHeader] = testFormHeader
    rtnHash[:testForms] = results
    rtnHash[:message] =  params[:message]

    render json: rtnHash
  end

  def create
    #version管理レコードを作成
    test_form_version_operation_id = params["test_form_version_operation_id"]

    testFormVersionOperation = nil
    if test_form_version_operation_id.blank?
      testFormVersionOperation = TestFormVersionOperation.new()
    else
      testFormVersionOperation = TestFormVersionOperation.find(test_form_version_operation_id)
    end
    byebug
    tesfFormHeader = testFormVersionOperation.test_form_header.build(headerTestForm_param)
    testForms = []
    testFormOptions = []

    params.require(:test_forms).each do |test|

      answer = test[:answer]
      #test_formのパラメータを取得
      testForm = testform_params(test)
      #test_form_optionsのパラメータを取得
      testFormOption = testformoption_params(test)

      #@tesfFormHeaderに関連づいたtestFormオブジェクトとして作成
      new_record = tesfFormHeader.test_form.build(testForm)

      #選択肢の数だけループ
      testFormOption[:options].each_with_index do |option, i|
        opt = {}
        opt[:label] = option
        opt[:display_order] = i
        if i == answer
          opt[:correct] = CONSTANTS::TESTFORM::CORRECT_ANSWER
        else
          opt[:correct] = CONSTANTS::TESTFORM::WRONG_ANSWER
        end

        #@tesfFormHに関連づいたtestFormOptionオブジェクトとして作成
        new_option = new_record.test_form_options.build(opt)
        testFormOptions.push(new_option)
      end

      #再び配列に入れる
      testForms.push(new_record)
    end

    if testFormVersionOperation.save  \
      && tesfFormHeader.save \
      && testForms.each{|record| record.save}  \
      && testFormOptions.each{|option| option.save}
      @result = "success"
    else
      @result = "fail"
    end

    render json: testForms
  end

  def update
    results = Array.new
    testFormOptions = []
    testForms = []
    
    header_param = params.require(:test_form_header)
    selectHeader = TestFormHeader.find(header_param[:id])
    selectHeader[:header_name] = header_param[:header_name]
    selectHeader[:test_type] = header_param[:test_type]

    params.require(:test_forms).each do |test|

      #test_formの変更点を設定
      selectForm = TestForm.find(test[:id])
      selectForm[:content] = test[:content]
      testForms.push(selectForm)

      #test_form_optionsのパラメータを取得
      testFormOption = testformoption_update_params(test)
      #選択肢の数だけループ
      testFormOption[:options].each_with_index do |option, i|
        selectRecord = TestFormOption.find(option[:id])
        selectRecord[:display_order] = i
        selectRecord[:label] = option[:label]
        testFormOptions.push(selectRecord)
      end
    end

    if selectHeader.save && testForms.each{|record| record.save} &&  testFormOptions.each{|option| option.save}
      @result = "success"
    else
      @result = "fail"
    end

    #更新後の値を取得して画面に返却
    params[:message] = "messsage ： change confirmd"
    show()
  end

  private
    def testform_params(params)
      params.permit(:content)
    end

    def testformoption_params(params)
      params.permit(:options => [])
    end

    def testformoption_update_params(params)
      params.permit(options:  [:id,:label,:updated_at])
    end

    def getTestFormOptionsRandom(id)
      TestFormOption.where(test_form_id: id).select(:id,:label,:test_form_id,:display_order).order("RAND()")
    end

end