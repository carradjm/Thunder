json.extract! song, :id, :title, :user_id, :description, 
                     :duration, :created_at, :updated_at, 
                     :track, :image

json.genre song.genre.name                     
json.uploader song.uploader.username

json.comments song.comments do |comment|
  json.id comment.id
  json.song_id comment.song_id
  json.author_id comment.user.id
  json.username comment.user.username
  json.author_pic comment.user.picture.url
  json.body comment.body
  json.time Date.parse(comment.created_at.to_s)
end

json.likes song.song_likes do |song_like|
  json.id song_like.id
  json.user_id song_like.user_id
end