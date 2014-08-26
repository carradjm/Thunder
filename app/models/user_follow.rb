class UserFollow < ActiveRecord::Base
  validates :following_id, :follower_id, presence: true
  
  belongs_to(
    :follower,
    class_name: "User",
    foreign_key: :follower_id,
    primary_key: :id
  )
  
  belongs_to(
    :following,
    class_name: "User",
    foreign_key: :following_id,
    primary_key: :id
  )
  
end
