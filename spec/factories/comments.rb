FactoryBot.define do
  factory :comment do
    association :user
    association :post
    comment { '投稿に対してのコメント' }
  end
  # factory :notification_comment, class:Comment do
  # 	association :user, factory: :notification_comment_user
  # 	association :post, factory: :notification_comment_post
  # 	comment { "通知コメント" }
  # end
  # factory :comment do
  #   association :user, factory: :notification_comment_user
  #   association :post, factory: :notification_comment_post
  #   comment { "投稿に対してのコメント" }
  # end
end
