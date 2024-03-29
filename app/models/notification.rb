class Notification < ApplicationRecord
	# 新着順
	default_scope -> { order(created_at: :desc) }

	# nilを許容するためtrueの指定
	belongs_to :post, optional: true
	belongs_to :comment, optional: true
	belongs_to :visiter, class_name: "User", foreign_key: "visiter_id", optional: true
	belongs_to :visited, class_name: "User", foreign_key: "visited_id", optional: true
end
