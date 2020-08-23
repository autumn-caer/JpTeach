class CreateTestForms < ActiveRecord::Migration[6.0]
  def change
    create_table :test_forms do |t|
      t.string :name
      t.text :content
      t.integer :answer
      t.string :option_one
      t.string :option_two
      t.string :option_three
      t.string :option_four
      t.string :user_name
      t.string :user_email
      t.timestamps
    end
  end
end
