class Api::SongsController < ApplicationController
  
  before_filter :require_logged_in!
  
  def index
    @songs = Song.all.includes(:comments, :uploader, :song_likes)
    
    render :index
  end
  
  def show
    @user = current_user
    
    @song = Song.includes(:comments, :uploader, :song_likes).find(params[:id])
      
    render partial: "api/songs/show.json", locals: { song: @song }
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