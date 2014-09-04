json.array!(@notifications) do |notification|
  json.partial! "api/notifications/show.json", notification: notification
end