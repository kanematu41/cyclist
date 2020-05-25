require 'rails_helper'

RSpec.describe Admin, type: :model do
  before do
  	@admin = build(:admin)
  end

  it '必要項目を満たしていれば有効' do
  	expect(@admin).to be_valid
  end
  it 'emailがなければ無効' do
    @admin.email = ''
    expect(@admin).not_to be_valid
  end
  it 'パスワードがなければ無効' do
    @admin.password = ''
    expect(@admin).not_to be_valid
  end
  it 'パスワードが不一致で無効' do
    @admin.password_confirmation = ''
    expect(@admin)
  end
end
