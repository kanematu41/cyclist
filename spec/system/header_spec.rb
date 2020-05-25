require 'rails_helper'

describe 'ヘッダーのテスト' do
  describe 'ログインしていない場合' do
    before do
      visit root_path
    end
    context 'ヘッダーの表示を確認' do
      it 'タイトルが表示される' do
        expect(page).to have_content 'cyclist'
      end
      it 'トップが表示される' do
        expect(page).to have_content 'トップ'
      end
      it '会員登録が表示される' do
        expect(page).to have_content '会員登録'
      end
      it 'ログインが表示される' do
        expect(page).to have_content 'ログイン'
      end
    end
  end
  describe 'ユーザーがログインしている場合' do
    let(:user1) { create(:user) }
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user1.email
      fill_in 'user[password]', with: user1.password
      click_button 'ログイン'
    end
    context 'ヘッダーの表示を確認' do
      it 'マイページが表示される' do
        expect(page).to have_content 'マイページ'
      end
      it 'タイムラインが表示される' do
        expect(page).to have_content 'タイムライン'
      end
      it '投稿が表示される' do
        expect(page).to have_content '投稿'
      end
      it '通知が表示される' do
        expect(page).to have_content '通知'
      end
      it '検索が表示される' do
        expect(page).to have_content '検索'
      end
      it 'ログアウトが表示される' do
        expect(page).to have_content 'ログアウト'
      end
    end
  end
  describe '管理者がログインしている場合' do
    let(:admin) { create(:admin) }
    before do
      visit new_admin_session_path
      fill_in 'admin[email]', with: admin.email
      fill_in 'admin[password]', with: admin.password
      click_button 'ログイン'
    end
    context 'ヘッダーの表示を確認' do
      it 'トップが表示される' do
        expect(page).to have_content 'トップ'
      end
      it 'ユーザーが表示される' do
        expect(page).to have_content 'ユーザー'
      end
      it 'ログアウトが表示される' do
        expect(page).to have_content 'ログアウト'
      end
    end
  end
end