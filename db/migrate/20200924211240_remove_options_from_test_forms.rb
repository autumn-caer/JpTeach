class RemoveOptionsFromTestForms < ActiveRecord::Migration[6.0]
  def change
    remove_column :test_forms, :option_one 
    remove_column :test_forms, :option_two
    remove_column :test_forms, :option_three
    remove_column :test_forms, :option_four
  end
end
