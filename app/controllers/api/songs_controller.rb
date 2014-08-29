class Api::SongsController < ApplicationController
  
  respond_to :json
  
  def index
    @songs = Song.all
   
    @playlists = current_user.playlists
    
    render :json => @songs
  end
  
  def show
    @song = Song.find(params[:id])
    @user = current_user
    @playlists = current_user.playlists
    @comments = @song.comments
  end
  
  def new
    @song = Song.new
    @genres = Genre.all.order(:name)
    
    render :new
  end
  
  def create
    @song = Song.new(song_params)
    @song.uploader = current_user
    
    if @song.save
      redirect_to song_url(@song)
    else
      fail
      flash.now[:errors] = @song.errors.full_messages
      render :new
    end
  end
  
  def destroy
  end
  
  private
  def song_params
    params.require(:song).permit(:title, :artist, :description, :genre_id, :track, :image)
  end
end