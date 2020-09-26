class Api::V1::TestFormController < ApiController
  before_action :set_tesfForms, only: [:show]
  before_action :text_check # この行を追加！

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    testForms = TestForm.all
    render json: testForms
  end

  def show
    render json: @tesfForms
  end

  def create 
    @tesfFormHeader = TestFormHeader.new(headerTestForm_param)
    @testForms = []
    testFormOptions = []

    params.require(:test_forms).each do |test|

      answer = test[:answer]
      #test_formのパラメータを取得
      testForm = testform_params(test)
      #test_form_optionsのパラメータを取得
      testFormOption = testformoption_params(test)

      #@tesfFormHeaderに関連づいたtestFormオブジェクトとして作成
      new_record = @tesfFormHeader.test_form.build(testForm)

      #選択肢の数だけループ
      testFormOption[:options].each_with_index do |option, i| 
        opt = {}
        opt[:label] = option
        opt[:display_order] = i
        if i == answer
          opt[:correct] = CORRECT_ANSWER
        else
          opt[:correct] = WRONG_ANSWER
        end

        #@tesfFormHに関連づいたtestFormOptionオブジェクトとして作成
        new_option = new_record.test_form_options.build(opt)
        testFormOptions.push(new_option)
      end

      #再び配列に入れる
      @testForms.push(new_record)
    end

    if  @tesfFormHeader.save && @testForms.each{|record| record.save} && testFormOptions.each{|option| option.save}
      @result = "success"
    else
      @result = "fail"
    end

    render json: @testform
  end

  def update 
    
  end
  
  private
    def set_tesfForms
      @tesfForms= TestForm.where(test_form_header_id: params[:id])
    end

    def headerTestForm_param
      params.require(:test_form_header).permit(:header_name,:question_num,:user_id,:test_type)
    end

    def testform_params(params)
      params.permit(:content)
    end

    def testformoption_params(params)
      params.permit(options: [])
    end

end