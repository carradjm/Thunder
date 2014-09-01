class Api::UserFollowsController < ApplicationController

  def index
    @user_follows = UserFollows.where(user_id: params[:id])
    render :index
  end
  
  def show
  end
  
  def create
    followed_user = User.find(params[:following_id])
    user_follow = UserFollow.new(following_id: followed_user.id, follower_id: current_user.id)
    
    user_follow.save
      
    if user_follow.save
      render partial: "api/user_follows/show.json", locals: { user_follow: user_follow }
    else
      render json: user_follow.errors.full_messages, status: :unprocessable_entity
    end 
  end
  
  def destroy
    user_follow = UserFollow.find(params[:id])
    
    user_follow.destroy
    render partial: "api/user_follows/show.json", locals: { user_follow: user_follow }
  end
  
end