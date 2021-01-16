class Api::V1::UserPageController < ApiController

  include Notification

  def index
    userId = 1
    user = User.select(:id, :name, :nickname).find(userId)
    rtnHash = {}
    rtnHash[:user] = user

    byebug
    notificationIds = getNotifications(userId)
    puts 'notificationIds'
    puts  notificationIds
    notifications = []
    notificationIds.each do |id|
      notifications.push(id + 'があなたをfollowしました。')
    end

    puts 'notifications'
    puts notifications

    rtnHash[:notifications] = notifications

    testFormHeader = User.joins(:test_form_headers).select("test_form_headers.*").where(id: userId).order('updated_at DESC').limit(10)

    realationship = Relationship.where(followed_id: '1').where(follower_id: '2')
    if realationship.length > 0
      rtnHash[:realationship] = true
    else 
      rtnHash[:realationship] = false
    end 
    rtnHash[:activeItems] = testFormHeader
    render json: rtnHash
  end

  def show
    userId = params[:followed_id]
    userId = 1
    user = User.select(:id, :name, :nickname).find(userId)
    rtnHash = {}
    rtnHash[:user] = user

    notifications = getNotifications(userId)
    rtnHash[:notifications] = notifications

    realationship = Relationship.where(followed_id: userId).where(follower_id: '2')    
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