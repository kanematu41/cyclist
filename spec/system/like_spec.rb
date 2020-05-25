# require 'rails_helper'

# describe '投稿に関するテスト' do
#   let(:user1) { create(:user) }
#   let(:user2) { create(:user) }
#   let!(:post1) { create(:post, user: user1) }
#   let!(:post2) { create(:post, user: user2) }
#   describe '投稿画面' do
# 	  before do
# 	  	visit new_user_session_path
# 	  	fill_in 'user[email]', with: user1.email
# 	  	fill_in 'user[password]', with: user1.password
# 	  	click_button 'ログイン'
# 	  end
# 	  context 'いいね' do
# 	  	before do
# 	  		visit post_path(post1)
# 	  	end
#   		it '成功' do
# 	  		expect do
# 	  			find('.fa-thumbs-up').click
# 	  			post post_likes_path(post1)
# 	  		end.to change(Like, :count).by(1)
# 	    end
# 		end
#   end
# end


