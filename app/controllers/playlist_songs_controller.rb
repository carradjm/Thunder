class PlaylistSongsController < ApplicationController
  
  def create
    song = Song.find(params[:song_id])
    playlist = Playlist.find(params[:playlist_id])
      
    playlist_song = PlaylistSong.new(playlist_id: playlist.id, song_id: song.id)
    
    playlist_song.save
    redirect_to song_url(song)
  end
  
  def destroy
    song = Song.find(params[:song_id])
    playlist = Playlist.find(params[:playlist_id])
    
    playlist_song = PlaylistSong.find_by_ids(playlist.id, song.id)
    
    playlist_song.destroy
    redirect_to playlist_url(playlist)
  end
  
end