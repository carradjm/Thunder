class UserFollow < ActiveRecord::Base
  validates :following_id, :follower_id, presence: true
  
  belongs_to(
    :follower,
    class_name: "User",
    foreign_key: :follower_id,
    primary_key: :id,
    inverse_of: :user_followers
  )
  
  belongs_to(
    :following,
    class_name: "User",
    foreign_key: :following_id,
    primary_key: :id,
    inverse_of: :user_following,
    counter_cache: true
  )
  
  after_commit :set_notification, on: [:create]
  
  has_many :notifications, as: :notifiable, inverse_of: :notifiable, dependent: :destroy
  
  def set_notification
    notification = self.notifications.unread.event(:new_follow_on_user).new
    notification.user = self.following
    notification.save!
  end
  
  #find the user_follow by both follower_id and following_id
  #finds the unique user_follow because there is a uniqueness validation on the combo
  def self.find_by_ids(follower_id, following_id)
    UserFollow.where("follower_id = ? AND following_id = ?", follower_id, following_id).first
  end
  
end
