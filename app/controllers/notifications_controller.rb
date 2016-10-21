class NotificationsController < ApplicationController
  def index
  	@notifications = Notification.all.reverse
  end

  def destroy
  	@notification = Notification.find(params[:id])
  	@notification.destroy
  end
end
