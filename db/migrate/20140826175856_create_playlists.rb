class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :title, null: false
      t.integer :user_id, null: false
      t.text :description
      t.integer :duration #length in milliseconds
      t.string :genre

      t.timestamps
    end
  end
end
