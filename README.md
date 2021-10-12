# Circle app

[![anakin1359](https://circleci.com/gh/anakin1359/circle_app.svg?style=svg)](https://circleci.com/gh/circleci/circleci-docs)
![ソースコードサイズ](https://img.shields.io/github/languages/code-size/anakin1359/circle_app)
![GitHub watchers](https://img.shields.io/github/watchers/anakin1359/circle_app?style=social)

Circle appはサークル活動を行うにあたり、チーム内でのコミュニケーションをより容易にわかりやすく行うためのWEBサイトです

### 情報(URL/ ID/ PW)
* サイトURL   : http://54.199.2.95
* 一般ユーザ  : sample@example.com / password01
* 管理者ユーザ: admin@example.com  / password0#

### 使用方法
* サイトURL: http://54.199.2.95/about

### 使用技術
* OS: Debian GNU/Linux 10 (buster)
* ruby: 2.5.9
* Ruby on Rails: 5.2.6
* PostgreSQL: 11.12
* Nginx: 1.20.0
* Unicorn: 6.0.0
* Docker: 20.10.7
* docker-compose: 1.29.2
* AWS
  * VPC:
  * EC2: Amazon Linux release 2 (Karoo)
* Capistrano3
* Google Maps API
* CircleCI: 2.1
* Rspec, rubocop

### 構成図
<img width="1121" alt="circle_app_flow" src="https://user-images.githubusercontent.com/81594028/137019901-ca814cb9-1a8e-4e60-a356-55241afbbb11.png">

### ER図
![circle_app_er](https://user-images.githubusercontent.com/81594028/137019788-6b20de08-8cd9-495f-bef4-4ed35e2f80ff.png)

### 機能一覧
* ユーザ登録/ログイン (devise)
* 検索機能 (ransack)
* 投稿機能
  * 画像投稿 (carrierwave/ mini_magick)
  * 位置情報検索 (geocoder)
* 表示機能
  * カレンダー表示 (simple_calendar)
  * ページネーション (kaminari)

### テスト
* rubocop
* Rspec
  * 単体テスト: model spec
  * 機能テスト: request spec
  * 統合テスト: system spec
