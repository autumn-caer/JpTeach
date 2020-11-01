class CreateTestResults < ActiveRecord::Migration[6.0]
  def change
    create_table :test_results do |t|
      t.references :answer_option_id, foreign_key: { to_table: :test_form_options }
      t.references :your_answer_option_id, foreign_key: { to_table: :test_form_options }
      t.string :option_display_orders
      t.references :test_result_header, foreign_key: true
      t.timestamps
    end
  end
end
