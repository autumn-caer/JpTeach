class Api::V1::UserPageController < ApiController

  def index
    userId = 1
    testFormHeader = User.joins(:test_form_headers).select("test_form_headers.*").where(id: userId)
    rtnHash = {}
    rtnHash[:testFormHeader] = testFormHeader
    render json: rtnHash
  end

end