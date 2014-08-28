class RemoveArtistFromSongs < ActiveRecord::Migration
  def change
    remove_column :artist, :songs
  end
end
