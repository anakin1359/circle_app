require 'rails_helper'
require 'support/capybara'

RSpec.describe "Users", type: :system do
  describe "認証テスト" do
    before do
      driven_by(:rack_test)
      visit root_path
    end

    context "Factory_botのテスト" do
      it "テストユーザの登録が正しく行われいてる" do
        expect(FactoryBot.build(:user)).to be_valid
      end
    end

    context "Loginしていない時" do
      it "ナビゲーションリンクに正しい情報が表示されている" do
        expect(page).to have_selector ".navbar-right", text: "新規登録"
        expect(page).to have_selector ".navbar-right", text: "ログイン"
        expect(page).not_to have_selector ".navbar-right", text: "ユーザ一覧"
        expect(page).not_to have_selector ".navbar-right", text: "マイページ"
        expect(page).not_to have_selector ".navbar-right", text: "編集画面"
        expect(page).not_to have_selector ".navbar-right", text: "ログアウト"
      end
    end
    
    context "Loginしている時" do
      # ここでユーザにLoginさせる処理を実装
      
      it "ナビゲーションリンクに正しい情報が表示されている" do
        expect(page).not_to have_selector ".navbar-right", text: "新規登録"
        # expect(page).to have_selector ".navbar-right", text: "ログイン"
        expect(page).to have_selector ".navbar-right", text: "ユーザ一覧"
        # expect(page).not_to have_selector ".navbar-right", text: "マイページ"
        # expect(page).not_to have_selector ".navbar-right", text: "編集画面"
        # expect(page).not_to have_selector ".navbar-right", text: "ログアウト"
      end

      # it "ユーザ一覧のリンクにアクセスができる" do
        
      # end

      # it "マイページのリンクにアクセスができる" do
        
      # end

      # it "編集画面のリンクにアクセスができる" do
        
      # end
    end
  end
  # pending "add some scenarios (or delete) #{__FILE__}"
end
