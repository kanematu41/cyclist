class RelationshipsController < ApplicationController
  before_action :authenticate_user!

	def create
		@user = User.find(params[:id])
		current_user.follow(params[:id])
		# フォロー通知
		@user.create_notification_follow!(current_user)
		# redirect_back(fallback_location: root_path)
	end

	def destroy
		@user = User.find(params[:id])
		current_user.unfollow(params[:id])
		# redirect_back(fallback_location: root_path)
	end
end
