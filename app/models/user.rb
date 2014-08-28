class User < ActiveRecord::Base
  validates :email, :password_digest, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}
  has_attached_file :picture, :styles => { :standard => "200x200" }
  validates_attachment_content_type(
          :picture,
          :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']
        )
  
  before_validation :ensure_session_token
  
  has_many(
    :uploaded_songs,
    class_name: "Song",
    foreign_key: :user_id
  )
  
  has_many :song_likes, inverse_of: :user
  has_many :likes, through: :song_likes, source: :song
  
  has_many :playlists
  has_many :comments
  
  has_many(
    :user_following,
    class_name: "UserFollow",
    foreign_key: :follower_id,
    primary_key: :id,
    inverse_of: :following
  )
  
  has_many(
    :user_followers,
    class_name: "UserFollow",
    foreign_key: :following_id,
    primary_key: :id,
    inverse_of: :follower
  )
  
  has_many :following, through: :user_following, source: :following
  has_many :followers, through: :user_followers, source: :follower
  
  attr_reader :password

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return nil unless user && user.is_password?(password)
    user
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(@password)
  end
  
  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end
  
  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end
  
  def following?(user)
    self.following.include?(user)
  end
  
  def liked_song?(song)
    self.likes.include?(song)
  end
  
  private
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
  
end
