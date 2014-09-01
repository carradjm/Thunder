json.extract! @user, :id, :email, :username, :session_token, 
                    :first_name, :last_name, :country, :city, :user_follows_count,
                   :picture, :songs_count, :notifications_count
                    
json.uploads @user.uploaded_songs do |song|
  json.partial! "api/songs/show.json", song: song
end

json.likes @user.likes do |song|
  json.partial! "api/songs/show.json", song: song
end
  
json.playlists @user.playlists do |playlist|
  json.extract! playlist, :id, :title, :description, :genre
  
  json.songs playlist.songs do |song|
    json.partial! "api/songs/show.json", song: song
  end
end

json.followers @user.followers do |follower|
  json.extract! follower, :id, :email, :username, :session_token, 
                      :first_name, :last_name, :country, :city, :user_follows_count,
                      :picture, :songs_count, :notifications_count
end

json.following @user.following do |following|
  json.extract! following, :id, :email, :username, :session_token, 
                      :first_name, :last_name, :country, :city, :user_follows_count,
                      :picture, :songs_count, :notifications_count
end

json.songLikes @user.song_likes do |like|
  json.extract! like, :id, :song_id, :user_id
end

json.userFollows @user.user_following do |user_follow|
  json.extract! user_follow, :id, :follower_id, :following_id
end