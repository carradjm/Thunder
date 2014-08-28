class ChangeGenreInSongsAgain < ActiveRecord::Migration
  def change
    remove_column :songs, :genre
    
    add_column :songs, :genre_name, :string
  end
end
