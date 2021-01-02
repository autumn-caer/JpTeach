class AddUniqueKeysToRelationships < ActiveRecord::Migration[6.0]
  def change
    add_index :relationships, [:follower_id, :followed_id], unique: true
  end
end
