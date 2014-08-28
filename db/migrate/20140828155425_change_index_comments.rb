class ChangeIndexComments < ActiveRecord::Migration
  def change
    remove_index :comments, column: [:song_id, :user_id]
    
    add_index :comments, :song_id
  end
end
