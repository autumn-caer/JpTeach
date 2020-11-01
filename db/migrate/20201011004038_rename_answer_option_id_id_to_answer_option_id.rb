class RenameAnswerOptionIdIdToAnswerOptionId < ActiveRecord::Migration[6.0]
  def change
    rename_column :test_results, :answer_option_id_id, :answer_option_id
    rename_column :test_results, :your_answer_option_id_id, :your_answer_option_id
  end
end
