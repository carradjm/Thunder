class Api::SongLikesController < ApplicationController

  def create
    song = Song.find(params[:song_id])
    song_like = SongLike.new(song_id: song.id, user_id: current_user.id)
    
    song_like.save
    redirect_to :back
  end
  
  def destroy
    song = Song.find(params[:song_id])
    song_like = SongLike.find_by_ids(song.id, current_user.id)
    
    song_like.destroy
    redirect_to :back
  end
  
end