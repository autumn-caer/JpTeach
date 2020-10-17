class CreateTestFormVersionOperations < ActiveRecord::Migration[6.0]
  def change
    create_table :test_form_version_operations do |t|

      t.timestamps
    end
  end
end
