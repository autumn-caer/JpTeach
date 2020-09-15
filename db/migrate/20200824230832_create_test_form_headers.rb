class CreateTestFormHeaders < ActiveRecord::Migration[6.0]
  def change
    create_table :test_form_headers do |t|
      t.string :header_name
      t.string :test_type
      t.integer :question_num
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
