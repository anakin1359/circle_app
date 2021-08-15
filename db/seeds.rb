# このファイルには、データベースをデフォルト値でシードするために必要な、すべてのレコード作成が含まれているはずです。
# このデータはその後、rails db:seedコマンドで読み込むことができます（またはdb:setupでデータベースと一緒に作成することもできます）。
#
# 例を挙げます。
#
# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "anakin1359",
  email: "anakin1359@gmail.com",
  password:              "password01",
  password_confirmation: "password01")

50.times do |n|
name  = Faker::Name.name
email = "test-user-0#{n+1}@railstutorial.org"
password = "password01"
User.create!(name:  name,
    email: email,
    password:              password,
    password_confirmation: password)
end
