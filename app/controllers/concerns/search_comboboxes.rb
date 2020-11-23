module SearchComboboxes extend ActiveSupport::Concern
    included do
        def getTestTypeList()
            User.joins(:test_form_headers).group(:test_type).pluck(:test_type)
        end
        def getUserIdList()
            User.joins(:test_form_headers).group("users.id").pluck("users.id")
        end
        def getFormIdList()
            User.joins(:test_form_headers).group("test_form_headers.id").pluck("test_form_headers.id")
        end
    end

end