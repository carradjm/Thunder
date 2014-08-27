class SongsController < ApplicationController
  
  before_filter :require_logged_in!
  
  def new
    @song = Song.new
    render :new
  end
  
  def create
    @song = current_user.songs.new(song_params)
    
    if @song.save
      redirect_to song_url(@song)
    else
      flash.now[:errors] = @song.errors.full_messages
      render :new
    end
  end
  
  def show
    @song = Song.find(params[:id])
    @user = current_user
    @playlists = current_user.playlists
    
    render :show
  end
  
  def like
    song = Song.find(params[:song_id])
    song_like = SongLike.new(song_id: song.id, user_id: current_user.id)
    
    song_like.save
    redirect_to song_url(song)
  end
  
  def unlike
    song = Song.find(params[:song_id])
    song_like = SongLike.find_by_ids(song.id, current_user.id)
    
    song_like.destroy
    redirect_to song_url(song)
  end
  
  def destroy
  end
  
  private
  def song_params
    params.require(:song).permit(:title, :artist, :description, :genre)
  end
end