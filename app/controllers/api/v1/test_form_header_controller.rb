class Api::V1::TestFormHeaderController < ApiController
  before_action :set_tesfForms, only: [:show]

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    testFormHeader = User.joins(:test_form_headers).select("test_form_headers.*")
    testTypeList = User.joins(:test_form_headers).group(:test_type).pluck(:test_type)
    userIdList = User.joins(:test_form_headers).group("users.id").pluck("users.id")
    testFormIdList     = User.joins(:test_form_headers).group("test_form_headers.id").pluck("test_form_headers.id")
    rtnHash = {}
    rtnHash[:testFormHeader] = testFormHeader
    rtnHash[:testTypeList] = testTypeList
    rtnHash[:userIdList] = userIdList
    rtnHash[:testFormIdList] = testFormIdList
    render json: rtnHash
  end

  def show
    render json: @tesfFormHeader  
  end

  private
    def set_tesfFormHeaders
        @tesfFormHeader= TestFormHeader.find(params[:id])
    end
end