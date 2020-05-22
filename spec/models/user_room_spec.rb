require 'rails_helper'

RSpec.describe UserRoom, type: :model do
	before do
		@user_room = create(:user_room)
	end

  it "必要項目を満たしていれば有効" do
    expect(@user_room).to be_valid
  end
  it "user_idが存在していなければ無効" do
    @user_room.user_id = ""
    expect(@user_room).not_to be_valid
  end
  it "room_idが存在していなければ無効" do
    @user_room.room_id = ""
    expect(@user_room).not_to be_valid
  end
end
