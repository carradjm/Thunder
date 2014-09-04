class ChangeLikesCount < ActiveRecord::Migration
  def change
    rename_column :songs, :likes_count, :song_likes_count
  end
end
