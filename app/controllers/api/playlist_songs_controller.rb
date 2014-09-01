class Api::PlaylistSongsController < ApplicationController
  
  def index
    @playlist_songs = PlaylistSong.where(playlist_id: params[:id])
    render :index
  end
  
  def show
  end
  
  def create
    song = Song.find(params[:song_id])
    playlist = Playlist.find(params[:playlist_id])
    
    playlist_song = PlaylistSong.new(playlist_id: playlist.id, song_id: song.id)
    
    playlist_song.save
    redirect_to :back
  end
  
  def destroy
    playlist_song = PlaylistSong.find(params[:id])
    
    playlist_song.destroy
    render partial: "api/playlists/show.json", locals: { playlist: playlist_song.playlist }
  end
  
end