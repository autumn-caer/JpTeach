class TestResult < ApplicationRecord
    belongs_to :test_result_header , dependent: :destroy
end
