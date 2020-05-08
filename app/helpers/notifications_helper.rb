module NotificationsHelper

	def notification_form(notification)
		@visiter = notification.visiter
		@post = notification.post_id

		# actionの選択
		case notification.action
			when "follow" then
				tag.a(@visiter.name, href:user_path(@visiter))+"があなたをフォロしました"
			when "like" then
				tag.a(@visiter.name, href:user_path(@visiter))+"が"+tag.a("あなたの投稿", href:post_path(@post))+"にいいねしました"
			when "comment" then
				tag.a(@visiter.name, href:user_path(@visiter))+"が"+tag.a("あなたの投稿", href:post_path(@post))+"にコメントしました"
			end
	end

	def unchecked_notifications
		@notifications = current_user.passive_notifications.where(checked: false)
	end
end
