class Song < ActiveRecord::Base
  validates :title, :artist, presence: true
  has_attached_file :track
  validates_attachment_content_type(
          :track,
          :content_type => ['audio/mpeg', 'audio/mp3', 'audio/mp4', 'audio/wav', 'audio/m4p']
        )
        
  has_attached_file :image, :styles => { :standard => "200x200>" }
  validates_attachment_content_type(
          :image,
          :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']
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
  
  # def following_recent_songs
  #   current_user.following.each do |user|
  #     user.uploaded_songs.each do |song|
  #
  #   end
  #
  # end
end
