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
    render json: @tesfForm
  end
  
  private
    def set_tesfForms
      @tesfForm= TestForm.find(params[:id])
    end

end