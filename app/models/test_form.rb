class TestForm < ApplicationRecord
    belongs_to :test_form_header , dependent: :destroy
    has_many :test_form_options
end
