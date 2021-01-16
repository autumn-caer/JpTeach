class AddExtentiontoUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :extention, :string, default: 'jpeg'
  end
end
