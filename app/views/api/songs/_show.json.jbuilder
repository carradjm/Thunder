json.extract! @song, :title, :user_id, :description, 
                     :duration, :created_at, :updated_at, 
                     :genre_id
json.track_path @song.track.path
json.image_path @song.image.path

json.uploader @song.uploader

json.comments @song.comments do |comment|
  json.id comment.id
  json.user_id comment.user_id
  json.body comment.body
end