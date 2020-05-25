FactoryBot.define do
  factory :user do
    name { 'テスト花子' }
    email { Faker::Internet.email }
    introduction { 'hanako' }
    password { 'password' }
    password_confirmation { 'password' }
  end
  factory :other_user, class:User do
    name { 'テスト太郎' }
    email { Faker::Internet.email }
    introduction { 'taro' }
    password { 'password' }
    password_confirmation { 'password' }
  end
  factory :user1, class:User do
    name { "花子" }
    email { 'hanako@example.com' }
    introduction { 'hanako' }
    password { 'password' }
    password_confirmation { 'password' }
  end
  factory :user2, class:User do
    name { '太郎' }
    email { 'taro@example.com' }
    introduction { 'taro' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
