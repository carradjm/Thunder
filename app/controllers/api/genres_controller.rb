class Api::GenresController < ApplicationController

  def index
    @genres = Genre.all
    
    render :index
  end
  
  def show
    @genre = Genre.includes(:songs).find(params[:id])
    @songs = @genre.songs
   
    render :show
  end
  
end