class Api::SongLikesController < ApplicationController

  def index
    @likes = SongLike.where(user_id: current_user.id)
    render :index
  end
  
  def show
  end
  
  def create
    song = Song.find(params[:song_id])
    @like = SongLike.new(song_id: song.id, user_id: current_user.id)
    
    if @like.save
      render partial: "api/song_likes/show.json", locals: { like: @like }
    else
      render json: @like.errors.full_messages, status: :unprocessable_entity
    end  
  end
  
  def destroy
    @song_like = SongLike.find(params[:id])
    
    @song_like.destroy
    render partial: "api/song_likes/show.json", locals: { like: @song_like }
  end
  
end