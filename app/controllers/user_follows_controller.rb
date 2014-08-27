class UserFollowsController < ApplicationController
  
  def create
    user_follow = current_user.user_following.new(following_id: params[:user_follow][:following_id])
    
    user_follow.save
      
    redirect_to user_url(params[:user_follow][:following_id])
  end
  
  def destroy
    user = User.find(params[:user_follow][:following_id])
    user_follow = UserFollow.find_by_ids(current_user.id, user.id) #UserFollow class method
    
    user_follow.destroy
    redirect_to user_url(user)
  end
  
end