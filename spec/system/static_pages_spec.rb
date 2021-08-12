require 'rails_helper'
require 'support/capybara'

RSpec.describe "StaticPages", type: :system do
  describe "StaticPageのテスト" do
    before do
      driven_by(:rack_test)
      visit root_path
    end

    context "Home画面内のリンクの挙動をテスト" do
      it "ロゴのリンクが正しく設定されている" do
        click_link "Circle App"
        expect(current_path).to eq root_path
      end

      it "ナビゲーションバーのHomeページへのリンクが正しく設定されている" do
        within ".navbar-right" do
          click_link "Home"
        end
        expect(current_path).to eq root_path
      end

      it "ナビゲーションバーの新規会員登録ページへのリンクが正しく設定されている" do
        within ".navbar-right" do
          click_link "signup"
        end
        expect(current_path).to eq signup_path
      end

      it "footer部のcontactページへのリンクが正しく設定されている" do
        click_link "Contact"
        expect(current_path).to eq contact_path
      end
    end
  end
end
