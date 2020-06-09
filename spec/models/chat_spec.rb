require 'rails_helper'

RSpec.describe Chat, type: :model do
	before do
    @chat = create(:chat)
 end

  it '必要項目を満たしていれば有効' do
    expect(@chat).to be_valid
  end
  it 'user_idが存在していなければ無効' do
    @chat.user_id = ''
    expect(@chat).not_to be_valid
  end
  it 'room_idが存在していなければ無効' do
    @chat.room_id = ''
    expect(@chat).not_to be_valid
  end
  it 'メッセージが存在していなければ無効' do
    @chat.message = ''
    expect(@chat).not_to be_valid
  end
end
	# 	@chat = build(:chat)
	# end

 #  it "必要項目を満たしていれば有効" do
 #  	expect(@chat).to be_valid
 #  end
 #  it "messageが存在していなければ無効" do
 #    @chat.message = ""
 #    expect(@chat).not_to be_valid
 #  end
 #  it "user_idが存在していなければ無効" do
 #  	chat = Chat.create(room: FactoryBot.create(:room), message: "チャットコメント")
 #    expect(chat).not_to be_valid
 #  end
 #  it "room_idが存在していなければ無効" do
 #  	chat = Chat.create(user: FactoryBot.create(:user), message: "投稿に対してのコメント")
 #    expect(chat).not_to be_valid
 #  end
