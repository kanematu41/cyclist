class Post < ApplicationRecord
	mount_uploaders :image, ImageUploader # carrierwave関連
	serialize :image
	acts_as_taggable # タグ機能

	belongs_to :user
	has_many 	 :comments, dependent: :destroy
	has_many 	 :likes, dependent: :destroy
	has_many 	 :notifications, dependent: :destroy

	validates :title, presence: true
	validates :body, presence: true
	validates :image, presence: { message: "を選択してください" }

	def liked_by?(user)
		likes.where(user_id: user.id).exists?
	end

	# コメント通知
	def create_notification_comment!(current_user, comment_id)
		# 投稿にコメントしている人を取得、全員に通知(自分以外)
		temp_ids = Comment.select(:user_id).where(post_id: id).where(user_id: current_user.id).distinct
		# 1つの投稿に複数通知
		temp_ids.each do |temp_id|
			save_notification_comment!(current_user, comment_id, temp_id["user_id"])
		end
		# 誰も投稿していない、投稿者に通知
		save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
	end

	def save_notification_comment!(current_user, comment_id, _visited_id)
		notification = current_user.active_notifications.new(
			 post_id: id,
 			comment_id: comment_id,
 			visited_id: user_id,
 			action: "comment"
	 )

		# 自分に対して、通知済み
		notification.checked = true if notification.visiter_id == notification.visited_id
		# 自分が投稿＝ログインユーザー 通知しない
		notification.save if notification.valid? && Post.find(id).user.id != current_user.id
	end

	# いいね通知
	def create_notification_by(current_user)
		# いいねされているか検索
		temp = Notification.where(["visiter_id = ? and visited_id = ? and post_id = ? and action = ?", current_user.id, user_id, id, "like"])

		# いいねされていないとき
		if temp.blank?
			notification = current_user.active_notifications.new(
				 post_id: id,
 				visited_id: user_id,
 				action: "like"
		 )
		end
		# 自分に対して、通知済み
		notification.checked = true if notification.visiter_id == notification.visited_id
		# 投稿ユーザー＝ログインユーザー 通知しない
		notification.save if notification.valid? && Post.find(id).user.id != current_user.id
	end

	# 検索
  def self.search(search, _user_or_post)
  	if search
  		Post.where(["title LIKE ?", "%#{search}%"])
  	else
  		Post.all
  	end
  end
end
