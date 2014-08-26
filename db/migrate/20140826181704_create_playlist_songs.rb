class CreatePlaylistSongs < ActiveRecord::Migration
  def change
    create_table :playlist_songs do |t|
      t.integer :playlist_id
      t.integer :song_id
    end
    
    add_index :playlist_songs, [:playlist_id, :song_id], unique: true
  end
end
