class TestFormHeader < ApplicationRecord
    belongs_to :user
    belongs_to :test_form_version_operation
    has_many :test_form
    has_many :test_result_header
end
