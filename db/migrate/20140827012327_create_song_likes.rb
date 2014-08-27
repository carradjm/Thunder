class CreateSongLikes < ActiveRecord::Migration
  def change
    create_table :song_likes do |t|
      t.integer :song_id
      t.integer :user_id

      t.timestamps
    end
    
    add_index :song_likes, [:song_id, :user_id], unique: true
  end
end
