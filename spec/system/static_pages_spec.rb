require 'rails_helper'
require 'support/capybara'

RSpec.describe "StaticPages", type: :system do
  describe "Home画面にアクセスしている時" do
    before do
      visit root_path
    end

    context "headerブロックのロゴのリンクから" do
      it "ホーム画面にアクセスができる" do
        click_link "Circle App"
        expect(current_path).to eq root_path
      end
    end

    context "ナビゲーションバーのリンクから" do
      it "ホーム画面にアクセスができる" do
        within ".navbar-right" do
          click_link "Home"
        end
        expect(current_path).to eq root_path
      end

      it "新規登録画面にアクセスができる" do
        within ".navbar-right" do
          click_link "新規登録"
        end
        expect(current_path).to eq new_user_registration_path
      end

      it "ログイン画面にアクセスができる" do
        within ".navbar-right" do
          click_link "ログイン"
        end
        expect(current_path).to eq new_user_session_path
      end
    end

    context "footer部のcontactページのリンクから" do
      # it "問い合わせ画面にアクセスができる" do
      #   click_link "Contact"
      #   expect(current_path).to eq contact_path
      # end

      it "「Circle appについて」画面にアクセスができる" do
        click_link "Circle appについて"
        expect(current_path).to eq about_path
      end
    end
  end
end
