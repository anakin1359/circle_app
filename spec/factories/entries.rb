FactoryBot.define do
  factory :entry do
    entry_name { "test_entry" }
    entry_count { 3 }
    entry_price { 1500 }
    association :user
    association :event
  end
end
