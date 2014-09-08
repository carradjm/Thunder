class User < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:username]
  
  validates :email, :password_digest, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}
  
  has_attached_file :picture, :styles => { :standard => "200x200" }, default_url: 'Daft-Punk.jpg'
  validates_attachment_content_type(
          :picture,
          :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']
        )
  
  has_many :notifications, inverse_of: :user, dependent: :destroy
  
  has_many(
    :uploaded_songs,
    class_name: "Song",
    foreign_key: :user_id,
    inverse_of: :uploader,
    dependent: :destroy
  )
  
  has_many :song_likes, inverse_of: :user
  has_many :likes, through: :song_likes, source: :song
  
  has_many :playlists, dependent: :destroy
  has_many :comments, inverse_of: :user, dependent: :destroy
  
  has_many(
    :user_following,
    class_name: "UserFollow",
    foreign_key: :follower_id,
    primary_key: :id,
    inverse_of: :follower
  )
  
  has_many(
    :user_followers,
    class_name: "UserFollow",
    foreign_key: :following_id,
    primary_key: :id,
    inverse_of: :following
  )
  
  has_many :following, through: :user_following, source: :following
  has_many :followers, through: :user_followers, source: :follower
  
  before_validation :ensure_session_token
  
  attr_reader :password

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return nil unless user && user.is_password?(password)
    user
  end
  
  def self.find_or_create_by_fb_auth_hash(hash)
    user = User.find_by(uid: hash[:uid], provider: hash[:provider])
    
    if user.nil?
      user = User.create!(
        email: hash[:info][:email], 
        first_name: hash[:info][:first_name], 
        last_name: hash[:info][:last_name],
        password_digest: SecureRandom::urlsafe_base64(16),
        picture: User.process_uri(hash[:info][:image])
      )
    end
    
    user
  end
  
  def self.process_uri(uri)
    open(uri, allow_redirections: :safe) do |r|
      r.base_uri.to_s
    end
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
