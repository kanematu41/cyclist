FactoryBot.define do
  factory :post do
  	association :user
    title { '投稿title' }
    body { '投稿内容' }
    image { [Rack::Test::UploadedFile.new(Rails.root.join('app/assets/images/top3.jpg'))] }
  end
end
