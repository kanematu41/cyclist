require 'rails_helper'

RSpec.describe Notification, type: :model do
  before do
    @user = create(:user)
    @other_user = create(:other_user)
    @post = create(:post)
    @comment = create(:comment)
  	@notification_follow = Notification.new(visiter_id: @user.id,
  																 				 	visited_id: @other_user.id,
  																 				 	post: nil,
  																 				 	comment: nil,
  																 				 	action: 'follow',
  																 				 	checked: true)
  	@notification_like = Notification.new(visiter_id: @user.id,
  																 				visited_id: @other_user.id,
  																 				post: @post,
  																 				comment: nil,
  																 				action: 'like',
  																 				checked: true)
  	@notification_comment = Notification.new(visiter_id: @user.id,
  																 				 	 visited_id: @other_user.id,
  																 				 	 post: @post,
  																 				 	 comment: @comment,
  																 				 	 action: 'comment',
  																 				 	 checked: true)
  end
  it 'フォロー通知出来ていれば有効' do
  	expect(@notification_follow).to be_valid
  end
  it 'いいね通知出来ていれば有効' do
  	expect(@notification_like).to be_valid
  end
  it 'コメント通知出来ていれば有効' do
  	expect(@notification_comment).to be_valid
  end
end
