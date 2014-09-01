json.extract! user, :id, :email, :username, :session_token, 
                    :first_name, :last_name, :country, :city, :user_follows_count,
                   :picture, :songs_count, :notifications_count
                    
json.uploads user.uploaded_songs do |song|
  json.partial! "api/songs/show.json", song: song
end

json.likes user.likes do |song|
  json.partial! "api/songs/show.json", song: song
end
  
json.playlists user.playlists do |playlist|
  json.extract! playlist, :id, :title, :description, :genre
  
  json.songs playlist.songs do |song|
    json.partial! "api/songs/show.json", song: song
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

json.songLikes song_likes do |like|
  json.partial! "api/song_likes/show.json", like: like
end

json.userFollows user_follows do |user_follow|
  json.partial! "api/user_follows/show.json", user_follow: user_follow
end