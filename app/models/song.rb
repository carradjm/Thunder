class Song < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:title, :uploader]
  
  validates :title, :track, presence: true
  has_attached_file :track, styles: { waveform: { format: :png, convert_options: { color: :transparent } } },
                    processors: [ :waveform ]
  do_not_validate_attachment_file_type :track
      
  has_attached_file :image, :styles => { :standard => "200x200" }, default_url: 'Daft-Punk.jpg'
  do_not_validate_attachment_file_type :image
  
  belongs_to(
    :uploader,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id,
    inverse_of: :uploaded_songs,
    counter_cache: true
  )
  
  belongs_to(
    :genre,
    class_name: "Genre",
    foreign_key: :genre_id,
    primary_key: :id,
  )
  
  has_many :playlist_songs, inverse_of: :song
  
  has_many :comments, inverse_of: :song, dependent: :destroy
  
  has_many :song_likes, inverse_of: :song
  
  has_many :playlists, through: :playlist_songs, source: :playlist
end
