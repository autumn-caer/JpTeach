class AddColumnTestFormHeaderOpenType < ActiveRecord::Migration[6.0]
  def change
    add_column :test_form_headers, :open_type, :integer, default: 0
  end
end
