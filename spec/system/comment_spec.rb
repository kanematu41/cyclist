require 'rails_helper'

describe '投稿に紐づくcommentテスト' do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let!(:post1) { create(:post, user: user1) }
  let!(:comment1) { create :comment, user: user1, post: post1 }
  let!(:comment2) { create :comment, user: user2, post: post1 }
  describe '投稿詳細画面' do
	  before do
	  	visit new_user_session_path
	  	fill_in 'user[email]', with: user1.email
	  	fill_in 'user[password]', with: user1.password
	  	click_button 'ログイン'
	  end
	  context 'コメント' do
	  	before do
	  		visit post_path(post1)
	  	end
	  	it 'コメントと表示されている' do
	  		expect(page).to have_content 'コメント'
	  	end
      it 'commentが正しく表示されている' do
        expect(page).to have_content comment1.comment
      end
  		it 'ユーザー画像のリンク先が正しい' do
  			expect(page).to have_link comment1.user.image, href: user_path(comment1.user)
  		end
	  	it 'commentフォームが表示されている' do
		  	expect(page).to have_field 'comment[comment]'
		  end
      it '削除リンクが表示されている' do
        expect(page).to have_link '削除', href: post_comments_path(comment1)
      end
      it '他人の削除リンクが表示されない' do
        expect(page).to have_no_link '削除', href: post_comments_path(comment2)
      end
	  end
	end
end