class Api::V1::TestFormHeaderController < ApiController
  before_action :set_tesfForms, only: [:show]

  #検索区分を取得モジュール
  include SearchComboboxes

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    #自分をfollowしているidリスト
    followerIdList = getFollwerIdList(1)
  
    #自身のテストを全て取得取得する
    #follwerのテスト_open_type: フォロワーOnlyとpublicを取得する
    testFormHeader = User.joins(:test_form_headers).where(test_form_headers: {user_id: 1}).select("test_form_headers.*, users.name")\
                          .union(User.joins(:test_form_headers)\
                          .where(test_form_headers: {user_id: followerIdList, open_type: [CONSTANTS::OPENTYPE::PUBLIC,CONSTANTS::OPENTYPE::FOLLOWER_ONLY]})\
                          .select("test_form_headers.*, users.name"))
    
    testTypeList = getTestTypeList()
    testFormIdList     = getFormIdList()
    userIdList = getUserIdList(1)
    
    userList =[]
    pushUserList(userList, userIdList)
    pushUserList(userList, followerIdList)

    rtnHash = {}
    rtnHash[:testFormHeader] = testFormHeader
    rtnHash[:testTypeList] = testTypeList
    rtnHash[:userIdList] = userList
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