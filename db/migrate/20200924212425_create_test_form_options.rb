class CreateTestFormOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :test_form_options do |t|
      t.string :label
      t.string :correct
      t.timestamps
      t.references :test_form, foreign_key: true
    end
  end
end
