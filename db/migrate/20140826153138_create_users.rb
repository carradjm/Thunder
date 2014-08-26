class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :username
      t.string :session_token
      t.string :first_name
      t.string :last_name
      t.string :full_name #combined first_name and last_name
      t.string :country
      t.string :city
      
      t.timestamps
    end
    
    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
  end
end
