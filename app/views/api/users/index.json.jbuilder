json.array!(@users) do |user|
  json.partial! "api/users/show", user: user
end