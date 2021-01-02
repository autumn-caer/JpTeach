class Api::V1::UserPageController < ApiController

  def index
    userId = 1
    user = User.select(:id, :name, :nickname).find(userId)
    rtnHash = {}
    rtnHash[:user] = user

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