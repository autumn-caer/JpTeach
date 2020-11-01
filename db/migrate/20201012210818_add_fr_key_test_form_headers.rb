class AddFrKeyTestFormHeaders < ActiveRecord::Migration[6.0]
  def change
    add_reference :test_form_headers, :test_form_version_operation, foreign_key: true
  end
end
