class Api::V1::TestFormHeaderController < ApiController
  before_action :set_tesfForms, only: [:show]

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    testFormHeader = User.joins(:test_form_headers).select("test_form_headers.*")
    render json: testFormHeader
  end

  def show
    render json: @tesfFormHeader  
  end

  private
    def set_tesfFormHeaders
        @tesfFormHeader= TestFormHeader.find(params[:id])
    end
end