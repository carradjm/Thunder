class Comment < ActiveRecord::Base
  
  belongs_to :user, inverse_of: :comments
  
  belongs_to :song, inverse_of: :comments
  
  has_many :notifications, as: :notifiable, inverse_of: :notifiable, dependent: :destroy
  
  after_commit :set_notification, on: [:create]
  
  private
  def set_notification
    notification = self.notifications.unread.event(:new_comment_on_song).new
    notification.user = self.song.uploader
    notification.save
  end
  
end
