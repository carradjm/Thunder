class ChangeGenreInSongsAgainAgain < ActiveRecord::Migration
  def change
    remove_column :songs, :genre_name
    
    add_column :songs, :genre_id, :integer
  end
end
