class TestFormHeader < ApplicationRecord
    belongs_to :user
    has_many :test_form
end
