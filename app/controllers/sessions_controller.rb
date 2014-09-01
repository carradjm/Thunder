class SessionsController < ApplicationController

  def new 
    @user = User.new
    render :new
  end
  
  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    
    unless @user.nil?
      login_user(@user)
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
  
  def destroy
    logout_user
    redirect_to new_session_url
  end
end