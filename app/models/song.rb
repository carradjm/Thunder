class Song < ActiveRecord::Base
  validates :title, :track, presence: true
  has_attached_file :track
  do_not_validate_attachment_file_type :track
      
  has_attached_file :image, :styles => { :standard => "200x200" }
  do_not_validate_attachment_file_type :image
  belongs_to(
    :uploader,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id,
  )
  
  belongs_to(
    :genre,
    class_name: "Genre",
    foreign_key: :genre_id,
    primary_key: :id
  )
  
  has_many :playlist_songs, inverse_of: :song
  
  has_many :comments
  
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
