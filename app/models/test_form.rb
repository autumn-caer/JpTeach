class TestForm < ApplicationRecord
    belongs_to :test_form_header , dependent: :destroy
end
