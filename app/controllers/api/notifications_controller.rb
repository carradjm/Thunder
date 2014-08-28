class NotificationsController < ApplicationController

  def show
    fail
    notification = current_user.notifications.find(params[:id])
    notification.update(is_read: true)
    redirect_to notification.url
  end
end