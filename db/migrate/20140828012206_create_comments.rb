class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :song_id
      t.integer :user_id
      t.string :body
      
      t.timestamps
    end
    
    add_index :comments, [:song_id, :user_id], unique: :true
  end
end
