# # 管理者ユーザ
# User.create!(
#   name: "admin",
#   email: "admin@example.com",
#   password:              "password0#",
#   password_confirmation: "password0#",
#   admin: true
# )

# # 一般ユーザ
# User.create!(
#   name: "anakin1359",
#   email: "anakin1359@gmail.com",
#   password:              "password01",
#   password_confirmation: "password01",
#   admin: false
# )

# # サンプルユーザ
# 50.times do |n|
# name  = Faker::Name.name
# email = "test-user-0#{n+1}@example.com"
# password = "password0$"
# User.create!(name:  name,
#     email: email,
#     password:              password,
#     password_confirmation: password)
# end

# # テストイベント
# 10.times do |n|
#   title  = "test-event-0#{n+1}"
#   introduction = "test-event-0#{n+1}_introduction"
#   entry_count = n * 5
#   event_price = n * 50
#   start_date = Date.today.beginning_of_week
#   end_date = Date.today.end_of_week
#   address = "東京都千代田区神田駿河台1-1"
#   event_icon = nil
#   user_id = 1
#   Event.create!(
#     title:  title,
#     introduction: introduction,
#     entry_count: entry_count,
#     event_price: event_price,
#     start_date: start_date,
#     end_date: end_date,
#     address: address,
#     event_icon: event_icon,
#     user_id: user_id
#   )
# end

# テストエントリー
10.times do |n|
  entry_count = 2
  entry_price = n * 250
  user_id = 10
  event_id = 1
  Entry.create!(
    entry_count: entry_count,
    entry_price: entry_price,
    user_id: user_id,
    event_id: event_id
  )
end
