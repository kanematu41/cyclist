require 'rails_helper'

describe 'ユーザー関連テスト' do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  describe 'ログインしている場合' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user1.email
      fill_in 'user[password]', with: user1.password
      click_button 'ログイン'
    end
    context 'ユーザー詳細画面' do
      before do
        visit user_path(user1)
      end
      it 'マイページと表示されている' do
        expect(page).to have_content 'マイページ'
      end
      it '名前が正しく表示されている' do
        expect(page).to have_content user1.name
      end
      it '自己紹介が正しく表示されている' do
        expect(page).to have_content user1.introduction
      end
      it 'フォロー数が表示されている' do
        expect(page).to have_content user1.following_user.count
      end
      it 'フォロワー数が表示されている' do
        expect(page).to have_content user1.follower_user.count
      end
      it 'プロフィール編集リンクが表示されている' do
        expect(page).to have_link '編集', href: edit_user_path(user1)
      end
      it '他人の編集リンクが表示されない' do
        visit user_path(user2)
        expect(page).to have_no_link '編集', href: edit_user_path(user2)
      end
    end
    context 'ユーザー編集画面' do
      before do
        visit edit_user_path(user1)
      end
      it 'プロフィール編集と表示されている' do
        expect(page).to have_content 'プロフィール編集'
      end
      it '名前が正しく表示されている' do
        expect(page).to have_field 'user[name]', with: user1.name
      end
      it '自己紹介が正しく表示されている' do
        expect(page).to have_field 'user[introduction]', with: user1.introduction
      end
      it '他人の編集画面に遷移できない' do
        visit edit_user_path(user2)
        expect(current_path).to eq(root_path)
      end
    end
  end
  describe 'ログインしていない場合' do
    context 'ページ遷移が正しく行われない' do
      it 'ログインページへリダイレクトする(show)' do
        visit user_path(user1)
        expect(current_path).to eq new_user_session_path
      end
      it 'ログインページへリダイレクトする(edit)' do
        visit edit_user_path(user1)
        expect(current_path).to eq new_user_session_path
      end
    end
  end
end
