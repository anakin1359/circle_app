Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  # js機能を有効にしてテストを行う場合のみ有効化
  config.before(:each, type: :system, js: true) do
    driven_by :selenium_chrome_headless
  end
end
