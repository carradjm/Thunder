class PlaylistsController < ApplicationController
  
  before_filter :require_logged_in!
  
  def new
    @playlist = Playlist.new
    
    render :new
  end
  
  def choose
    render :choose
  end
  
  def create
    @playlist = current_user.playlists.build(playlist_params)
    
    if @playlist.save
      redirect_to user_url(@playlist.user)
    else
      flash.now[:errors] = @playlist.errors.full_messages
      render :new
    end
  end
  
  def show
    @playlist = Playlist.find(params[:id])
    @songs = @playlist.songs
    render :show
  end
  
  def destroy
  end
  
  def add_song
    song = Song.find(params[:song_id])
    playlist = Playlist.find(params[:playlist_id])
      
    playlist_song = PlaylistSong.new(playlist_id: playlist.id, song_id: song.id)
    
    playlist_song.save
    redirect_to song_url(song)
  end
  
  def remove_song
    song = Song.find(params[:song_id])
    playlist = Playlist.find(params[:playlist_id])
    
    playlist_song = PlaylistSong.find_by_ids(playlist.id, song.id)
    
    playlist_song.destroy
    redirect_to playlist_url(playlist)
  end
  
  private
  def playlist_params
    params.require(:playlist).permit(:title, :description, :genre, :song_ids => [])
  end
end