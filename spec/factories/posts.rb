FactoryBot.define do
  factory :post do
    subject { "test_post" }
    comment { "test_comment" }
    association :user
    association :entry
  end
end
