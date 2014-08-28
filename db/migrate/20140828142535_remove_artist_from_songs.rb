class RemoveArtistFromSongs < ActiveRecord::Migration
  def change
    remove_column :songs, :artist
  end
end
