require 'rails_helper'

RSpec.describe Relationship, type: :model do
	before do
		@user = create(:user)
		@other_user = create(:other_user)
		@relationship = Relationship.new(follower_id: @user.id, followed_id: @other_user.id)
	end

	it '別のユーザーをフォローできる' do
		expect(@relationship).to be_valid
	end
	it 'フォローユーザーが空だと無効' do
		@relationship.follower_id = ''
		expect(@relationship).not_to be_valid
	end
	it 'フォロワーユーザーが空だと無効' do
		@relationship.followed_id = ''
		expect(@relationship).not_to be_valid
	end
end
