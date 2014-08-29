json.array!(users) do |user|
  json.partial! "users/show.json", user: user
end