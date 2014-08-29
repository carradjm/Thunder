json.extract! @user, :email, :password_digest, :username, :session_token, 
                    :first_name, :last_name, :country, :city, :user_follows_count,
                    :songs_count, :notifications_count
                    
json.uploads @user.uploaded_songs do |song|
  json.extract! song, :title, :user_id, :description, 
                       :duration, :created_at, :updated_at, 
                       :genre_id
  json.track_path song.track.path
  json.image_path song.image.path
end

json.likes @user.likes do |song|
  json.extract! song, :title, :user_id, :description, 
                       :duration, :created_at, :updated_at, 
                       :genre_id
  json.track_path song.track.path
  json.image_path song.image.path
end
  
json.playlists @user.playlists do |playlist|
  json.extract! playlist, :title, :description, :genre
  
  json.songs playlist.songs do |song|
    json.extract! song, :title, :user_id, :description, 
                         :duration, :created_at, :updated_at, 
                         :genre_id
    json.track_path song.track.path
    json.image_path song.image.path
  end
end

json.followers @user.followers do |follower|
  json.extract! follower, :email, :password_digest, :username, :session_token, 
                      :first_name, :last_name, :country, :city, :user_follows_count,
                      :songs_count, :notifications_count
end

json.following @user.following do |following|
  json.extract! following, :email, :password_digest, :username, :session_token, 
                      :first_name, :last_name, :country, :city, :user_follows_count,
                      :songs_count, :notifications_count
end











# , :title, :user_id, :description,
#                      :duration, :created_at, :updated_at,
#                      :genre_id
# json.track_path @song.track.path
# json.image_path @song.image.path
#
# json.comments @song.comments do |comment|
#   json.id comment.id
#   json.user_id comment.user_id
#   json.body comment.body
# end