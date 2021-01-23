module SearchComboboxes extend ActiveSupport::Concern
    included do
        def getTestTypeList()
            User.joins(:test_form_headers).group(:test_type).pluck(:test_type)
        end
        def getUserIdList(ids)
            User.joins(:test_form_headers).where(id: ids).group("users.id, users.name").pluck("users.id, users.name")
        end
        def getFormIdList()
            User.joins(:test_form_headers).group("test_form_headers.id").pluck("test_form_headers.id")
        end
        def getFollwerIdList(id)
            Relationship.joins("INNER JOIN Users ON relationships.follower_id = users.id")\
                        .where(followed_id: id).group(:follower_id).pluck("follower_id, users.name")
        end

        def pushUserList(toList, fromList) 
            fromList.each do | arr | 
              userObj = {}
              userObj[:id] = arr[0]
              userObj[:name] = arr[1]
              toList.push(userObj)
            end
        end
    end

end