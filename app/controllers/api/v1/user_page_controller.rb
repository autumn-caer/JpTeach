class Api::V1::UserPageController < ApiController

  include Notification

  def index
    userId = params[:followed_id]
    userId = 1
    user = User.select(:id, :name, :nickname).find(userId)
    rtnHash = {}
    rtnHash[:user] = user

    notifications = getNotifications(userId)
    rtnHash[:notifications] = notifications

    realationship = Relationship.where(followed_id: userId)    
    testFormHeader = User.joins(:test_form_headers).select("test_form_headers.*").where(id: userId).order('test_form_headers.updated_at DESC').limit(10)

    if realationship.size > 0
      rtnHash[:realationship] = true
    else 
      rtnHash[:realationship] = false
    end 
    rtnHash[:activeItems] = testFormHeader
    render json: rtnHash
  end

  def show
    userId = params[:followed_id]
    user = User.select(:id, :name, :nickname).find(userId)
    rtnHash = {}
    rtnHash[:user] = user

    notifications = getNotifications(userId)
    rtnHash[:notifications] = notifications

    realationship = Relationship.where(followed_id: userId)
    testFormHeader = User.joins(:test_form_headers).select("test_form_headers.*").where(id: userId).order('test_form_headers.updated_at DESC').limit(10)

    if realationship.length > 0
      rtnHash[:realationship] = true
    else 
      rtnHash[:realationship] = false
    end 
    rtnHash[:activeItems] = testFormHeader
    render json: rtnHash
  end

end