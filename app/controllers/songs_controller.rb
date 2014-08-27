class SongsController < ApplicationController
  
  before_filter :require_logged_in!
  
  def index
    @songs = Song.all
    # @followed_songs = current_user.followers.songs
    @playlists = current_user.playlists
    
    render :index
  end
  
  def show
    @song = Song.find(params[:id])
    @user = current_user
    @playlists = current_user.playlists
    
    render :show
  end
    
  
  def new
    @song = Song.new
    render :new
  end
  
  def create
    @song = current_user.uploaded_songs.new(song_params)
    
    if @song.save
      redirect_to song_url(@song)
    else
      flash.now[:errors] = @song.errors.full_messages
      render :new
    end
  end
  
  def destroy
  end
  
  private
  def song_params
    params.require(:song).permit(:title, :artist, :description, :genre, :track)
  end
end