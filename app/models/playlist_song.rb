class PlaylistSong < ActiveRecord::Base

  belongs_to :playlist, inverse_of: :playlist_songs
  
  belongs_to :song, inverse_of: :playlist_songs
  
  def self.find_by_ids(playlist_id, song_id)
    PlaylistSong.where("playlist_id = ? AND song_id = ?", playlist_id, song_id).first
  end
  
end