require 'rails_helper'

describe '投稿に関連テスト' do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let!(:post1) { create(:post, user: user1) }
  let!(:post2) { create(:post, user: user2) }
  describe '投稿画面' do
	  before do
	  	visit new_user_session_path
	  	fill_in 'user[email]', with: user1.email
	  	fill_in 'user[password]', with: user1.password
	  	click_button 'ログイン'
	  end
	  context '投稿フォーム表示の確認' do
	  	before do
	  		visit new_post_path
	  	end
	  	it '投稿と表示されている' do
	  		expect(page).to have_content '投稿'
	  	end
	  	it 'titleフォームが表示されている' do
		  	expect(page).to have_field 'post[title]'
		  end
	  	it 'bodyフォームが表示されている' do
		  	expect(page).to have_field 'post[body]'
		  end
	  	# it 'imageフォームが表示されている' do
		  # 	expect(page).to have_field 'post[image]'
		  # end
	  end
	  # context '投稿する' do
	  # 	before do
	  # 		visit new_post_path
	  # 	end
	  # 	it "正しく投稿される" do
	  # 		fill_in 'post[title]', with: 'test'
	  # 		fill_in 'post[body]', with: 'test'
	  # 		attach_file 'post[image]', '#{Rails.root}/app/assets/images/top3.jpg'
	  # 		click_button '投稿する'
	  # 	end
	  # end
	  context '詳細画面' do
	  	before do
	  		visit post_path(post1)
	  	end
	  	it 'titleが正しく表示されている' do
        expect(page).to have_content post1.title
      end
      it 'bodyが正しく表示されている' do
        expect(page).to have_content post1.body
      end
  		it 'ユーザー名のリンク先が正しい' do
  			expect(page).to have_link post1.user.name, href: user_path(post1.user)
  		end
      it '編集リンクが表示されている' do
        expect(page).to have_link '編集', href: edit_post_path(post1)
      end
      it '削除リンクが表示されている' do
        expect(page).to have_link '削除', href: post_path(post1)
      end
      it '他人の編集リンクが表示されない' do
        visit post_path(post2)
        expect(page).to have_no_link '編集', href: edit_post_path(post2)
      end
      it '他人の削除リンクが表示されない' do
        visit post_path(post2)
        expect(page).to have_no_link '削除', href: post_path(post2)
      end
      it 'いいね数の表示' do
        expect(page).to have_content post1.likes.count
      end
    end
    context '編集画面' do
    	before do
    		visit edit_post_path(post1)
    	end
      it 'titleが正しく表示されている' do
        expect(page).to have_field 'post[title]', with: post1.title
      end
      it 'bodyが正しく表示されている' do
        expect(page).to have_field 'post[body]', with: post1.body
      end
      it '他人の編集画面に遷移できない' do
        visit edit_post_path(post2)
        expect(current_path).to eq(root_path)
      end
    end
	end
end