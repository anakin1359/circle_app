require 'rails_helper'
require 'support/capybara'

RSpec.describe "Users", type: :system do
  describe "Loginしていない時" do
    before do
      visit root_path
    end

    context "ホーム画面のナビゲーションリンクに" do
      it "正しい情報が表示されている" do
        expect(page).to have_text('新規登録')
        expect(page).to have_text('ログイン')
        expect(page).not_to have_text('ユーザ一覧')
        expect(page).not_to have_text('マイページ')
        expect(page).not_to have_text('編集画面')
        expect(page).not_to have_text('ログアウト')
      end
    end
  end
    
  describe "Loginしている時" do
    before do
      @user = create(:user)
      sign_in @user
    end

    context "ホーム画面のナビゲーションリンクに" do
      it "正しい情報が表示されている" do
        visit root_path
        expect(page).not_to have_text('新規登録')
        expect(page).not_to have_text('ログイン')
        expect(page).to have_text('ユーザ一覧')
        expect(page).to have_text('マイページ')
        expect(page).to have_text('編集画面')
        expect(page).to have_text('ログアウト')
      end
    end
  end
end
