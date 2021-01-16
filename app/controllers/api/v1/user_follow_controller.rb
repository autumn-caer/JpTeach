class Api::V1::UserFollowController < ApiController
    def create 

      follower_id = params[:follower_id]
      followed_id = params[:followed_id]
      #ユーザー関係テーブルに新規登録
      rel =  Relationship.new
      rel.follower_id = 2
      rel.followed_id = 1
      rel.save

      rtnHash = {}
      rtnHash[:realationship] = true
      render json: rtnHash
    end

    def destroy 
      follower_id = params[:follower_id]
      followed_id = params[:followed_id]
  
      Relationship.where(followed_id: '1').where(follower_id: '2').delete_all

      rtnHash = {}
      rtnHash[:realationship] = false
      render json: rtnHash
    end
end