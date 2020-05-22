require 'rails_helper'

RSpec.describe Comment, type: :model do
	before do
    @comment = create(:comment)
  end

  it "必要項目を満たしていれば有効" do
    expect(@comment).to be_valid
  end
  it "user_idが存在していなければ無効" do
    @comment.user_id = ""
    expect(@comment).not_to be_valid
  end
  it "post_idが存在していなければ無効" do
    @comment.post_id = ""
    expect(@comment).not_to be_valid
  end
  it "commentが存在していなければ無効" do
    @comment.comment = ""
    expect(@comment).not_to be_valid
  end
end
# 		@comment = build(:comment)
# 	end

#   it "必要項目を満たしていれば有効" do
#   	expect(@comment).to be_valid
#   end
#   it "commentが存在していなければ無効" do
#     @comment.comment = ""
#     expect(@comment).not_to be_valid
#   end
#   it "user_idが存在していなければ無効" do
#   	comment = Comment.create(post: FactoryBot.create(:post), comment: "投稿に対してのコメント")
#     expect(comment).not_to be_valid
#   end
#   it "post_idが存在していなければ無効" do
#   	comment = Comment.create(user: FactoryBot.create(:user), comment: "投稿に対してのコメント")
#     expect(comment).not_to be_valid
#   end
# end
