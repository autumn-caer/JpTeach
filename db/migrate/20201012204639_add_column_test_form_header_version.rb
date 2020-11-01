class AddColumnTestFormHeaderVersion < ActiveRecord::Migration[6.0]
  def change
    add_column :test_form_headers, :version, :integer, default: 0
  end
end
