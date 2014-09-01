class Api::UsersController < ApplicationController

  before_action :require_logged_in!, only: [:show, :index]
  
  def index
    @users = User.all
    
    render :index
  end
  
  def show 
    @user = User.includes(:uploaded_songs, :likes, :playlists,
                          :followers, :following)
                          .find(params[:id])
    @song_likes = SongLike.where(user_id: params[:id])
    @following = @user.following
    @followers = @user.followers
    
    @user_follows = UserFollow.where(following_id: params[:id])
    
    render partial: "api/users/show.json", locals: { user: @user, song_likes: @song_likes, 
                                                     followers: @followers, following: @following,
                                                     user_follows: @user_follows}
  end
  
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