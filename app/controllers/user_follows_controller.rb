class UserFollowsController < ApplicationController
  
  def create
    user_follow = UserFollow.new(following_id: params[:user_follow][:following_id], follower_id: current_user.id)
    
    user_follow.save
      
    redirect_to user_url(params[:user_follow][:following_id])
  end
  
  def destroy
    user = User.find(params[:user_follow][:following_id])
    user_follow = UserFollow.find_by_ids(current_user.id, user.id).first #UserFollow class method
    
    user_follow.destroy
    redirect_to user_url(user)
  end
  
end