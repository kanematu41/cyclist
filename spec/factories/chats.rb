FactoryBot.define do
  factory :chat do
    association :user
    association :room
    message { 'チャットコメント' }
  end
end
