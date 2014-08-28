class ChangeGenreInSongs < ActiveRecord::Migration
  def change
    remove_column :songs, :genre
    
    add_column :songs, :genre, :integer
  end
end
