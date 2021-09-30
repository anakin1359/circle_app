FactoryBot.define do
  factory :event do
    title          { "test_event" }
    introduction   { "test_introduction" }
    entry_count    { 5 }
    event_price    { 500 }
    start_time     { Date.today.beginning_of_week }
    end_time       { Date.today.end_of_week }
    address        { "東京都千代田区神田駿河台1-1" }
    event_icon     { nil }
    association :user
    # association :entry
  end
end
