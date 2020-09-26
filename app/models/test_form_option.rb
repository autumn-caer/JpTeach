class TestFormOption < ApplicationRecord
    belongs_to :test_form, dependent: :destroy
end
