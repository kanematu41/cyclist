# require 'rails_helper'

# describe '投稿に関するテスト' do
#   let(:user1) { create(:user) }
#   let(:user2) { create(:user) }
#   describe 'ユーザー詳細画面' do
# 	  before do
# 	  	visit new_user_session_path
# 	  	fill_in 'user[email]', with: user1.email
# 	  	fill_in 'user[password]', with: user1.password
# 	  	click_button 'ログイン'
# 	  end
# 	  context 'いいね' do
# 	  	before do
# 	  		visit user_path(user2)
# 	  	end
#   		it '成功' do
# 	  		expect do
#           visit follow_path(user2),
#           	params: {follower_id: user1.id, followed_id: user2.id},
#           		xhr: true
#         end.to change(Relationship, :count).by(1)
# 	    end
# 		end
#   end
# end
