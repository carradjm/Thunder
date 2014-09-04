class AddStatstoSongs < ActiveRecord::Migration
  def change
    add_column :songs, :likes_count, :integer
    add_column :songs, :shares_count, :integer
    add_column :songs, :comments_count, :integer
  end
end
