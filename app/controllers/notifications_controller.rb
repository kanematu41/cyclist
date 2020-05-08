class NotificationsController < ApplicationController
  def index
  	@notifications = current_user.passive_notifications
  	@notifications.where(checked: false).each do |notification| #未確認通知
  		notification.update_attributes(checked: true) #確認済み、複数更新
  	end
  end

  def destroy
  	@notifications = current_user.passive_notifications.destroy_all
  	redirect_to notifications_path
  end
end
