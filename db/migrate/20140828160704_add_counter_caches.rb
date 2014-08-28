class AddCounterCaches < ActiveRecord::Migration
  def change
    add_column :users, :user_follows_count, :integer
    add_column :users, :songs_count, :integer
    add_column :users, :notifications_count, :integer
  end
end
