FactoryBot.define do
	# アクションによっての通知
  factory :notification_follow, class: Notification do
    association :visiter, factory: :user
    association :visited, factory: :other_user
    action { 'follow' }
    checked { true }
  end
  factory :notification_like, class: Notification do
  	association :visiter, factory: :user
  	association :visited, factory: :other_user
  	association :post
  	association :comment
  	action { 'like' }
  	checked { true }
  end
  factory :notification_comment, class: Notification do
  	association :visiter, factory: :user
  	association :visited, factory: :other_user
  	association :post
  	association :comment
  	action { 'comment' }
  	checked { true }
  end
end
