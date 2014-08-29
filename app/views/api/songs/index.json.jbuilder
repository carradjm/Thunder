json.array!(songs) do |songs|
  json.partial! "songs/show.json", song: song
end