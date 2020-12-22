class Api::V1::UserSearchController < ApiController

    def index
        users = User.select(:name,:image)
        rtnHash = {}
        rtnHash[:users] =  users
        render json: rtnHash
    end
end