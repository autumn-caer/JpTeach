class Api::V1::ResultHeaderController < ApiController
  # before_action :authenticate_api_user! # この行を追加！
  before_action :set_tesfForms, only: [:show]

  #検索区分を取得モジュール
  include SearchComboboxes
  include Notification

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    userId = 1;
    
  
    testFormHeaders = TestResultHeader.joins(:test_form_header) \
                                    .where(user_id: userId) \
                                    .select("test_form_headers.header_name,
                                             test_form_headers.test_type,
                                             test_form_headers.question_num,
                                             test_form_headers.version,
                                             test_form_headers.created_at,
                                             test_result_headers.test_form_header_id,
                                             test_form_headers.test_form_version_operation_id,
                                             test_form_headers.open_type,
                                             test_form_headers.user_id,
                                             count(test_result_headers.id) as count_all")
                                    .group(:test_form_header_id \
                                           ,:test_form_version_operation_id)

    resultHeaderList = []
    testFormHeaders.each_with_index do | testFormHeader,i |
      resultHeaders = TestResultHeader.where(test_form_header_id: testFormHeader.test_form_header_id)
      resultHeaderList.push(resultHeaders)
    end

    testTypeList = getTestTypeList()
    testFormIdList     = getFormIdList()
    userIdList = getUserIdList(userId)
    followerIdList = getFollwerIdList(userId)

    userList =[]
    pushUserList(userList, userIdList)
    pushUserList(userList, followerIdList)

    rtnHash = {}
    rtnHash[:testFormHeaders] = testFormHeaders
    rtnHash[:resultHeaderList] = resultHeaderList
    rtnHash[:testTypeList] = testTypeList
    rtnHash[:userIdList] = userList
    rtnHash[:testFormIdList] = testFormIdList

    notifications = getNotifications(userId)
    rtnHash[:notifications] = notifications

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