module Notification extend ActiveSupport::Concern
    def getNewFollowerList(id)
    #   Relationship.where(follower_id: id, created_at: TTime.zone.yesterday.beginning_of_day...Time.zone.today.current).pluck("id")
      Relationship.joins("INNER JOIN Users ON relationships.follower_id = users.id").where(followed_id: id).pluck("users.id","users.nickname","relationships.created_at")
    end

    def getFollwerdUserNotifications(followedIdList)
        TestFormHeader.where(user_id: followedIdList, created_at: Time.zone.yesterday.beginning_of_day...Time.zone.today.current)
    end

    def getFollowedIdNewTestList(id)
        Relationship.joins("INNER JOIN Users ON relationships.followed_id = users.id")\
                    .joins("INNER JOIN test_form_headers ON relationships.followed_id = test_form_headers.user_id")\
                    .where(follower_id: id).pluck("users.id","users.nickname","test_form_headers.created_at")
    end

    def getNotifications(userId)
        notifications = []
    
        #followerしているuserが新しいテストを追加した情報
        followedIdNewTestList = getFollowedIdNewTestList(userId)
        followedIdNewTestList.each do |array|
          notification = {}
          message = array[1] + 'が新しいテストを追加しました。'
          notification[:user_id] =  array[0] 
          notification[:nickname] =  array[1] 
          notification[:message] =  message
          notification[:created_at] =  array[2]
          notifications.push(notification)
        end

        #新しいFollower情報
        newFolowerIds = getNewFollowerList(userId)
        newFolowerIds.each do |array|
          notification = {}
          message = array[1] + 'があなたをFollowしました。'
          notification[:user_id] =  array[0] 
          notification[:nickname] =  array[1] 
          notification[:message] =  message
          notification[:created_at] =  array[2]
          notifications.push(notification)
        end

        return notifications
    end
end