class AddForeignKeyToTestForms < ActiveRecord::Migration[6.0]
  def change
    add_reference :test_forms, :test_form_header, foreign_key: true
  end
end
