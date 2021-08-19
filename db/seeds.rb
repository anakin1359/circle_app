# 管理者ユーザ（Adminモデル）
Admin.create!(
  name: "admin",
  email: "admin@example.jp",
  password:              "password0#",
  password_confirmation: "password0#"
)

# 管理者ユーザ（Userモデル）
User.create!(
  name: "admin",
  email: "admin@example.com",
  password:              "password0#",
  password_confirmation: "password0#",
  admin: true
)

# 一般ユーザ
User.create!(
  name: "anakin1359",
  email: "anakin1359@gmail.com",
  password:              "password01",
  password_confirmation: "password01",
  admin: false
)

# サンプルユーザ
50.times do |n|
name  = Faker::Name.name
email = "test-user-0#{n+1}@example.com"
password = "password0$"
User.create!(name:  name,
    email: email,
    password:              password,
    password_confirmation: password)
end
