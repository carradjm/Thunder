class Song < ActiveRecord::Base
  validates :title, :artist, presence: true
  has_attached_file :track
  validates_attachment_content_type(
          :track,
          :content_type => /\Aaudio\/.*\Z/
        )
  
  
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
