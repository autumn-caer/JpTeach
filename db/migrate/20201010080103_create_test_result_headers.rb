class CreateTestResultHeaders < ActiveRecord::Migration[6.0]
  def change
    create_table :test_result_headers do |t|
      t.integer :correct_num
      t.integer :try_time
      t.references :test_form_header, foreign_key: true
      t.timestamps
    end
  end
end
