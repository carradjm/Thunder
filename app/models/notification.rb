class Notification < ActiveRecord::Base

  include Rails.application.routes.url_helpers

  EVENTS = {
    1 => :new_comment_on_song,
    2 => :new_follow_on_user
  }

  EVENT_IDS = EVENTS.invert

  belongs_to :user, inverse_of: :notifications, counter_cache: true
  belongs_to :notifiable, inverse_of: :notifications, polymorphic: true

  validates :event_id, inclusion: { in: EVENTS.keys }
  validates :is_read, inclusion: { in: [true, false] }
  validates :notifiable, :user, presence: true

  scope :read, -> { where(is_read: true) }
  scope :unread, -> { where(is_read: false) }
  scope :event, ->(event_name) { where(event_id: EVENT_IDS[event_name]) }

  def url
    case self.event_name
    when :new_comment_on_song
      comment = self.notifiable
      song_url(comment.song_id)
    when :new_follow_on_user
      user_follow = self.notifiable
      user_url(user_follow.following_id)
    end
  end
  
  def json_url #for use with jBuilder - returned URL is for Backbone
    case self.event_name
    when :new_comment_on_song
      comment = self.notifiable
      "/#/songs/#{comment.song_id}"
    when :new_follow_on_user
      user_follow = self.notifiable
      "/#/users/#{user_follow.follower_id}"
    end
  end

  def text
    case self.event_name
    when :new_comment_on_song
      comment = self.notifiable
      comment_user = comment.user
      song = Song.find(comment.song_id)
      "#{comment_user.username} commented on your song '#{song.title}'"
    when :new_follow_on_user
      user_follow = self.notifiable
      follower = User.find(user_follow.follower_id)
      "#{follower.username} is now following you!"
    end
  end

  def event_name
    EVENTS[self.event_id]
  end

  def default_url_options
    options = {}
    options[:host] = Rails.env.production? ? "soundcloud-clone-malcolm.herokuapp.com" : "localhost:3000"
    options
  end
end