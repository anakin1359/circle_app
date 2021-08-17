require 'rails_helper'
require 'support/capybara'

RSpec.describe "StaticPages", type: :system do
  describe "ホーム画面のテスト" do
    before do
      driven_by(:rack_test)
      visit root_path
    end

    context "Home画面内のリンクをテスト" do
      it "header部のロゴのリンクが正しく設定されている" do
        click_link "Circle App"
        expect(current_path).to eq root_path
      end

      it "ナビゲーションバーのHomeページへのリンクが正しく設定されている" do
        within ".navbar-right" do
          click_link "Home"
        end
        expect(current_path).to eq root_path
      end

      it "ナビゲーションバーの新規登録ページへのリンクが正しく設定されている" do
        within ".navbar-right" do
          click_link "新規登録"
        end
        expect(current_path).to eq new_user_registration_path
      end

      it "ナビゲーションバーのログインページへのリンクが正しく設定されている" do
        within ".navbar-right" do
          click_link "ログイン"
        end
        expect(current_path).to eq new_user_session_path
      end
      
      it "footer部のcontactページへのリンクが正しく設定されている" do
        click_link "Contact"
        expect(current_path).to eq contact_path
      end
    end
  end
end
