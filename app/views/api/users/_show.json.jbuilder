json.extract! user, :id, :email, :username, :session_token, 
                    :first_name, :last_name, :country, :city, :user_follows_count,
                    :picture, :songs_count, :notifications_count
                    
json.uploads user.uploaded_songs do |song|
  json.extract! song, :id, :title, :user_id, :description, 
                       :duration, :created_at, :updated_at, 
                       :track, :image
  json.waveform song.track(:waveform)
  json.uploader song.uploader.username
end

json.likes user.likes do |song|
  json.extract! song, :id, :title, :user_id, :description, 
                       :duration, :created_at, :updated_at, 
                       :track, :image
end
  
json.playlists user.playlists do |playlist|
  json.extract! playlist, :id, :title, :description, :genre
end

json.followers user.followers do |follower|
  json.extract! follower, :id, :email, :username,
                      :first_name, :last_name, :country, :city, :user_follows_count,
                      :picture, :songs_count
end

json.following user.following do |following|
  json.extract! following, :id, :email, :username, 
                      :first_name, :last_name, :country, :city, :user_follows_count,
                      :picture, :songs_count
end

json.songLikes user.song_likes do |like|
  json.extract! like, :id, :song_id, :user_id
end

json.userFollows user.user_following do |user_follow|
  json.extract! user_follow, :id, :follower_id, :following_id
end