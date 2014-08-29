class Api::UsersController < ApplicationController

  before_action :require_logged_in!, only: [:show, :index]
  
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      login_user(@user)
      redirect_to @user
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
  
  def index
    @users = User.all
    render :index
  end
  
  def show 
    @user = User.find(params[:id])
    @uploads = @user.uploaded_songs
    @likes = @user.likes
    @playlists = @user.playlists
    @followers = @user.followers
    @following = @user.following
  end
  
  def edit
    @user = User.find(params[:id])
    
    render :edit
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_update_params)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password, :username, :picture)
  end
  
  def user_update_params
    params.require(:user).permit(:email, :password, :username, :first_name, :last_name, :country, :city, :picture)
  end

end