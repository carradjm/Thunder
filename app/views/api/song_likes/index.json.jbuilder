json.array!(@likes) do |like|
  json.partial! "api/song_likes/show.json", like: like
end