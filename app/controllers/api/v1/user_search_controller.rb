class Api::V1::UserSearchController < ApiController

    def index
        users = User.select(:id,:name)
        rtnHash = {}
        rtnHash[:users] =  users
        render json: rtnHash
    end
end