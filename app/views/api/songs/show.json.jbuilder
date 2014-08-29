json.extract! @song, :title, :user_id, :description, 
                     :duration, :created_at, :updated_at, 
                     :genre_id, :track, :image
                     
json.uploader @song.uploader.username

json.comments @song.comments do |comment|
  json.id comment.id
  json.user_id comment.user_id
  json.body comment.body
end