class SongLike < ActiveRecord::Base
  
  belongs_to :song
  
  belongs_to :user
  
  def self.find_by_ids(song_id, user_id)
    SongLike.where("song_id = ? AND user_id = ?", song_id, user_id).first
  end
  
end
