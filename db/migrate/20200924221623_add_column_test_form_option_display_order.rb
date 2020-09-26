class AddColumnTestFormOptionDisplayOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :test_form_options, :displayOrder, :integer
  end
end
