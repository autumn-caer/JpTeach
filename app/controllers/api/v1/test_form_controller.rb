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
    @tesfForms.each do | testForm |
      testForm.answer = nil
    end
    render json: @tesfForms
  end

  def create 
    
    @tesfFormHeader = TestFormHeader.new(headerTestForm_param)
    @testForms = []

    params.require(:test_forms).each do |test|
      #ひとつずつパラメータを許可
      permitted = testform_params(test)
      #@raceに関連づいたRecordオブジェクトとして作成し
      new_record = @tesfFormHeader.test_form.build(permitted)
      #再び配列に入れる
      @testForms.push(new_record)
    end

    if  @tesfFormHeader.save && @testForms.each{|record| record.save}
      @result = "success"
    else
      @result = "fail"
    end

    render json: @testform
  end
  
  private
    def set_tesfForms
      @tesfForms= TestForm.where(test_form_header_id: params[:id])
    end

    def headerTestForm_param
      params.require(:test_form_header).permit(:header_name,:question_num,:user_id,:test_type)
    end

    def testform_params(params)
      params.permit(:content,:answer,:option_one,:option_two,:option_three,:option_four)
    end

end