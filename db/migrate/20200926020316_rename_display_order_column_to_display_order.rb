class RenameDisplayOrderColumnToDisplayOrder < ActiveRecord::Migration[6.0]
  def change
    rename_column :test_form_options, :displayOrder, :display_order
  end
end
