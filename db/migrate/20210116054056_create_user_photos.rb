class CreateUserPhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :user_photos do |t|
      t.mediumblob :image
      t.string :extension, default: 'jpeg'
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
