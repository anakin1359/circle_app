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

# テストユーザ
# 50.times do |n|
# name  = Faker::Name.name
# email = "test-user-0#{n+1}@example.com"
# password = "password0$"
# User.create!(name:  name,
#     email: email,
#     password:              password,
#     password_confirmation: password)
# end

# テストイベント
# 10.times do |n|
#   title  = "test-event-0#{n+1}"
#   introduction = "test-event-0#{n+1}_introduction"
#   entry_count = n * 5
#   event_price = n * 50
#   start_time = Date.today.beginning_of_week
#   end_time = Date.today.end_of_week
#   address = "東京都千代田区神田駿河台1-1"
#   event_icon = nil
#   user_id = 1
#   entry_id = n + 1
#   Event.create!(
#     title:  title,
#     introduction: introduction,
#     entry_count: entry_count,
#     event_price: event_price,
#     start_time: start_time,
#     end_time: end_time,
#     address: address,
#     event_icon: event_icon,
#     user_id: user_id,
#     entry_id: entry_id
#   )
# end

# # テストエントリー
10.times do |n|
  entry_name = "test-entry-0#{n+1}"
  entry_count = n + 1
  entry_price = n * 200
  user_id = 2
  event_id = 1
  Entry.create!(
    entry_name: entry_name,
    entry_count: entry_count,
    entry_price: entry_price,
    user_id: user_id,
    event_id: event_id
  )
end

# テストコメント
10.time do |n|
  subject = "件名: テスト0#{n+1}"
  comment = "内容: これはテストコメントです#{n+1}"
  user_id = 2
  entry_id = 38
  Post.create!{
    subject: subject,
    comment: comment,
    user_id: user_id,
    entry_id: entry_id
  }
end
