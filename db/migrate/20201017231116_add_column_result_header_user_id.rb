class AddColumnResultHeaderUserId < ActiveRecord::Migration[6.0]
  def change
    add_reference :test_result_headers, :user, foreign_key: true
  end
end
