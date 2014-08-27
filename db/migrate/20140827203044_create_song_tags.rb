class CreateSongTags < ActiveRecord::Migration
  def change
    create_table :song_tags do |t|
      t.integer :tag_id
      t.integer :song_id
      
      t.timestamps
    end
    
    add_index :song_tags, [:tag_id, :song_id], unique: true
  end
end
