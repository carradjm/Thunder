class Song < ActiveRecord::Base
  validates :title, :artist, presence: true
  has_attached_file :track
  has_attached_file :logo
  
  belongs_to(
    :uploader,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id,
  )
  
  has_many :playlist_songs, inverse_of: :song
  
  has_many :song_likes, inverse_of: :song
  
  has_many :playlists, through: :playlist_songs, source: :playlist
end
