module SearchComboboxes extend ActiveSupport::Concern
    included do
        def getTestTypeList()
            User.joins(:test_form_headers).group(:test_type).pluck(:test_type)
        end
        def getUserIdList(ids)
            User.joins(:test_form_headers).where(id: ids).group("users.id").pluck("users.id")
        end
        def getFormIdList()
            User.joins(:test_form_headers).group("test_form_headers.id").pluck("test_form_headers.id")
        end
        def getFollwerIdList(id)
            Relationship.where(followed_id: id).group(:follower_id).pluck("follower_id")
        end
    end

end