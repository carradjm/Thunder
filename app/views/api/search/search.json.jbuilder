if @results.any? {|result| result.searchable_type == 'Song'}
  json.songs @results do |result|
    if result.searchable_type == 'Song'
      json.extract! result.searchable, :id, :title, :user_id, :description,
                           :duration, :created_at, :updated_at,
                           :track, :image
      json.genre result.searchable.genre.name
    end
  end
end


if @results.any? {|result| result.searchable_type == 'User'}
  json.users @results do |result|
    if result.searchable_type == 'User'
      json.extract! result.searchable, :id, :email, :username, :session_token,
                          :first_name, :last_name, :country, :city, :user_follows_count,
                          :picture, :songs_count, :notifications_count
    end
  end
end