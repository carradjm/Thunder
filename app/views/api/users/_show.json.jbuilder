json.extract! user, :id, :email, :username, :session_token, 
                    :first_name, :last_name, :country, :city, :user_follows_count,
                   :picture, :songs_count, :notifications_count
                    
json.uploads user.uploaded_songs do |song|
  json.extract! song, :id, :title, :user_id, :description, 
                       :duration, :created_at, :updated_at, 
                       :genre_id, :image, :track
end

json.likes user.likes do |song|
  json.extract! song, :id, :title, :user_id, :description, 
                       :duration, :created_at, :updated_at, 
                       :genre_id, :image, :track
end
  
json.playlists user.playlists do |playlist|
  json.extract! playlist, :id, :title, :description, :genre
  
  json.songs playlist.songs do |song|
    json.extract! song, :id, :title, :user_id, :description, 
                         :duration, :created_at, :updated_at, 
                         :genre_id, :image, :track
  end
end

json.followers user.followers do |follower|
  json.extract! follower, :id, :email, :username, :session_token, 
                      :first_name, :last_name, :country, :city, :user_follows_count,
                      :picture, :songs_count, :notifications_count
end

json.following user.following do |following|
  json.extract! following, :id, :email, :username, :session_token, 
                      :first_name, :last_name, :country, :city, :user_follows_count,
                      :picture, :songs_count, :notifications_count
end