json.songs @songs do |song|
  json.extract! song, :id, :title, :user_id, :description, 
                       :duration, :created_at, :updated_at, 
                       :track, :image

  json.waveform song.track(:waveform)
  json.genre song.genre.name                     
  json.uploader song.uploader.username

  json.likes song.song_likes do |song_like|
    json.id song_like.id
    json.user_id song_like.user_id
  end
end