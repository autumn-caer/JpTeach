class Api::V1::UserSearchController < ApiController
    include Notification

    def index
        rtnHash = {}
        userId = 1
        notifications = getNotifications(userId)
        rtnHash[:notifications] = notifications

        users = User.select(:id,:name)
        rtnHash[:users] =  users
        render json: rtnHash
    end
end