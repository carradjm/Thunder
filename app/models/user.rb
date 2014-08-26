class User < ActiveRecord::Base
  validates :email, :password_digest, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}
  
  before_validation :ensure_session_token
  
  has_many :songs
  has_many :playlists
  has_many(
    :user_following,
    class_name: "UserFollow",
    foreign_key: :following_id,
    primary_key: :id
  )
  
  has_many :following, through: :user_following, source: :following
  
  has_many(
    :user_followers,
    class_name: "UserFollow",
    foreign_key: :follower_id,
    primary_key: :id
  )
  
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
  
  private
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
  
end
