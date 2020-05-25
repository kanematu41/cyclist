require 'rails_helper'

RSpec.describe User, type: :model do
  before do
  	@user = build(:user)
  end

  it '必要項目を満たしていれば有効' do
  	expect(@user).to be_valid
  end
  it '名前がなければ無効' do
  	@user.name = ''
  	expect(@user).not_to be_valid
  end
  it 'emailがなければ無効' do
    @user.email = ''
    expect(@user).not_to be_valid
  end
  it 'emailが重複で無効' do
  	User.create(
  		name: 'テスト太郎',
  		email: 'test@example.com',
  		password: 'password',
  		)
    @user.email = 'test@example.com'
    expect(@user).not_to be_valid
  end
  it 'パスワードがなければ無効' do
    @user.password = ''
    expect(@user).not_to be_valid
  end
  it 'パスワードが6文字未満で無効' do
  	@user.password = 'passwor'
  	expect(@user).not_to be_valid
  end
  it 'パスワードが不一致で無効' do
    @user.password_confirmation = ''
    expect(@user)
  end
end
