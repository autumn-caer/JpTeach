class RemoveImageFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :image
    remove_column :users, :extention
  end
end
