require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:image_path) { Rails.root.join('app/assets/images/top3.jpg') }
  let(:image) { Rack::Test::UploadedFile.new(image_path) }
	before do
		# @post = FactoryBot.build(:post)
    @post = build(:post)
	end

  it '必要項目を満たしていれば有効' do
  	expect(@post).to be_valid
  end
  it '画像2数でも有効' do
    @post = create(:post, image: [image, image])
    expect(@post).to be_valid
  end
  it '画像3数でも有効' do
    post = create(:post, image: [image, image, image])
    expect(post).to be_valid
  end
  it 'タイトルがなければ無効' do
  	@post.title = ''
  	expect(@post).not_to be_valid
  end
  it '投稿内容がなければ無効' do
  	@post.body = ''
  	expect(@post).not_to be_valid
  end
  it '画像がなければ無効' do
  	@post = build(:post, image: nil)
  	expect(@post).not_to be_valid
  end
  it 'ユーザー情報がなければ無効' do
  	post = Post.create(
  		title: '投稿タイトル',
  		body: '投稿説明',
  		image: image
  		)
  	expect(post).to be_invalid
  end
end
