class Api::UserFollowsController < ApplicationController

  def create
    followed_user = User.find(params[:user_id])
    user_follow = UserFollow.new(following_id: followed_user.id, follower_id: current_user.id)
    
    user_follow.save
      
    redirect_to :back
  end
  
  def destroy
    user = User.find(params[:user_id])
    user_follow = UserFollow.find_by_ids(current_user.id, user.id) #UserFollow class method
    
    user_follow.destroy
    redirect_to :back
  end
  
end