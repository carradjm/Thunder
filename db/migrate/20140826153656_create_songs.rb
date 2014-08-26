class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title, null: false
      t.string :artist, null: false
      t.integer :user_id, null: false #user who uploaded song
      t.text :description
      t.string :genre
      t.integer :duration #length of song in milliseconds
      
      t.timestamps
    end
    
    add_index :songs, :title
    add_index :songs, :artist
    add_index :songs, :user_id
    add_index :songs, :genre
  end
end
