class Playlist < ActiveRecord::Base
  
  belongs_to :user
  
  has_many(
    :playlist_songs,
    class_name: "PlaylistSong",
    foreign_key: :playlist_id,
    primary_key: :id
  )
  
  has_many :songs, through: :playlist_songs, source: :song
end
