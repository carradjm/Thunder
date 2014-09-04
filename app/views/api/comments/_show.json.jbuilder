json.id comment.id
json.song_id comment.song_id
json.author_id comment.user.id
json.username comment.user.username
json.author_pic comment.user.picture.url
json.body comment.body
json.time Date.parse(comment.created_at.to_s)