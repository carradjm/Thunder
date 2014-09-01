json.array!(@songs) do |song|
  json.partial! "api/songs/show.json", song: song
end