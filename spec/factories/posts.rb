FactoryBot.define do
  factory :post do
  	association :user
    title { "投稿title" }
    body { "投稿内容" }
    image { [ Rack::Test::UploadedFile.new(Rails.root.join'app/assets/images/no_image.png') ] }
  end
end
