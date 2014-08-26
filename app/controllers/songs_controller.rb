class SongsController < ApplicationController
  
  def new
    @song = Song.new
    render :new
  end
  
  def create
    @song = current_user.songs.new(song_params)
    
    if @song.save
      redirect_to user_song_url(@song)
    else
      flash.now[:errors] = @song.errors.full_messages
      render :new
    end
  end
  
  def show
  end
  
  def destroy
  end
  
  private
  def song_params
    params.require(:song).permit(:title, :artist, :description)
  end
end