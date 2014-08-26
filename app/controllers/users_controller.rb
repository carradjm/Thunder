class UsersController < ApplicationController

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
  
  def show
    @user = User.find(params[:id])
    @songs = @user.songs
    # @playlist = @user.playlists
    # @followers = @user.followers
    # @following = @user.following
    #
    render :show
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end