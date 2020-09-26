class RemoveAnswerFromTestForms < ActiveRecord::Migration[6.0]
  def change
    remove_column :test_forms, :answer
    remove_column :test_forms, :name
    remove_column :test_forms, :user_name
    remove_column :test_forms, :user_email
  end
end
