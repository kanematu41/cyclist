require 'rails_helper'

RSpec.describe Like, type: :model do
	before do
    @like = create(:like)
  end

  it "必要項目を満たしていれば有効" do
    expect(@like).to be_valid
  end
  it "user_idが存在していなければ無効" do
    @like.user_id = ""
    expect(@like).not_to be_valid
  end
  it "post_idが存在していなければ無効" do
    @like.post_id = ""
    expect(@like).not_to be_valid
  end
	# 	@like = build(:like)
	# end

	# it "必要項目を満たしていれば有効" do
	# 	expect(@like).to be_valid
	# end
 #  it "user_idが存在していなければ無効" do
 #  	like = Like.create(post: FactoryBot.create(:post))
 #    expect(like).not_to be_valid
 #  end
 #  it "post_idが存在していなければ無効" do
 #  	like = Like.create(user: FactoryBot.create(:user))
 #    expect(like).not_to be_valid
 #  end
end
