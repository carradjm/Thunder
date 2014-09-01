json.extract! playlist, :id, :title, :user_id, :description, 
                     :duration, :created_at, :updated_at
                     
json.user playlist.user.username

json.songs playlist.songs do |song|
  json.extract! song, :id, :title, :user_id, :description, 
                       :duration, :created_at, :updated_at, 
                       :genre_id, :track, :image
end

json.playlistSongs playlist.playlist_songs do |playlistSong|
  json.extract! playlistSong, :id, :playlist_id, :song_id
end