class Playlist < ActiveRecord::Base
  
  belongs_to :user
  
  has_many :playlist_songs, inverse_of: :playlist
  
  has_many :songs, through: :playlist_songs, source: :song
end
