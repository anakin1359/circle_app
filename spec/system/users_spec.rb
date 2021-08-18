require 'rails_helper'
require 'support/capybara'

RSpec.describe "Users", type: :system do
  describe "Loginしていない時" do
    before do
      visit root_path
    end

    context "ホーム画面のナビゲーションリンクに" do
      it "新規登録の項目が表示されている" do
        expect(page).to have_text('新規登録')
      end

      it "ログインの項目が表示されている" do
        expect(page).to have_text('ログイン')
      end

      it "ユーザ一覧の項目が表示されていない" do
        expect(page).not_to have_text('ユーザ一覧')
      end

      it "マイページの項目が表示されていない" do
        expect(page).not_to have_text('マイページ')
      end

      it "編集画面の項目が表示されていない" do
        expect(page).not_to have_text('編集画面')
      end

      it "ログアウトの項目が表示されていない" do
        expect(page).not_to have_text('ログアウト')
      end
    end

    context "新規登録画面内に" do
      before do
        visit new_user_registration_path
      end

      it "Nameの項目が表示されている" do
        expect(page).to have_text('Name')
      end

      it "メールアドレスの項目が表示されている" do
        expect(page).to have_text('メールアドレス')
      end

      it "パスワードの項目が表示されている" do
        expect(page).to have_text('パスワード')
      end

      it "確認用パスワードの項目が表示されている" do
        expect(page).to have_text('確認用パスワード')
      end

      it "登録ボタンが表示されている" do
        # ボタンの存在性確認
      end
    end

    context "ログイン画面内に" do
      before do
        visit new_user_session_path
      end

      it "メールアドレスの項目が表示されている" do
        expect(page).to have_text('メールアドレス')
      end

      it "パスワードの項目が表示されている" do
        expect(page).to have_text('パスワード')
      end

      it "ログインボタンが表示されている" do
        # ボタンの存在性確認
      end
    end
  end

  describe "Loginしている時" do
    before do
      @user = create(:user)
      sign_in @user
    end

    context "ホーム画面のナビゲーションリンクに" do
      before do
        visit root_path
      end

      it "新規登録の項目が表示されていない" do
        expect(page).not_to have_text('新規登録')
      end

      it "ログインの項目が表示されていない" do
        expect(page).not_to have_text('ログイン')
      end

      it "ユーザ一覧の項目が表示されている" do
        expect(page).to have_text('ユーザ一覧')
      end

      it "マイページの項目が表示されている" do
        expect(page).to have_text('マイページ')
      end

      it "編集画面の項目が表示されている" do
        expect(page).to have_text('編集画面')
      end

      it "ログアウトの項目が表示されている" do
        expect(page).to have_text('ログアウト')
      end
    end

    context "ユーザ一覧画面内に" do
      it "正しい情報が表示されている" do
      end
    end

    context "マイページ画面内に" do
      it "正しい情報が表示されている" do
      end
    end

    context "ユーザ編集画面内に" do
      it "正しい情報が表示されている" do
      end
    end
  end

  describe "ユーザの新規登録を行う場合" do
    before do
      visit new_user_registration_path
    end

    scenario "成功した場合はflashメッセージ（success）が表示されている" do
      fill_in('user[name]',                  with: 'user01')
      fill_in('user[email]',                 with: 'user01@example.com')
      fill_in('user[password]',              with: 'password01')
      fill_in('user[password_confirmation]', with: 'password01')
      click_button('signup')
      expect(page).to have_text('アカウント登録が完了しました')
    end

    scenario "失敗した場合はflashメッセージ（alert）が表示されている" do
      fill_in('user[name]',                  with: 'user01')
      fill_in('user[email]',                 with: 'user01@example.com')
      fill_in('user[password]',              with: 'password01')
      fill_in('user[password_confirmation]', with: 'password10')
      click_button('signup')
      expect(page).to have_text('エラーが発生したため ユーザ は保存されませんでした')
    end
  end
  
  describe "ユーザログインを行う場合" do
    before do
      @user = create(:user)
      visit new_user_session_path
    end

    scenario "成功した場合はflashメッセージ（success）が表示されている" do
      fill_in('user[email]',    with: 'user01@example.com')
      fill_in('user[password]', with: 'password01')
      click_button('Log in')
      expect(page).to have_text('ログインしました')
    end

    scenario "失敗した場合はflashメッセージ（alert）が表示されている" do
      fill_in('user[email]',    with: 'user01@example.com')
      fill_in('user[password]', with: 'password10')
      click_button('Log in')
      expect(page).to have_text('メールアドレスまたはパスワードが違います')
    end
  end

  describe "ユーザ情報の編集を行う場合" do
    before do
      @user = create(:user)
      sign_in @user
      visit edit_user_registration_path
    end

    scenario "成功した場合はflashメッセージ（success）が表示されている" do
      fill_in('user[email]',                 with: 'user01@example.com')
      fill_in('user[current_password]',      with: 'password01')
      fill_in('user[password]',              with: 'password02')
      fill_in('user[password_confirmation]', with: 'password02')
      click_button('Update')
      expect(page).to have_text('アカウント情報を変更しました')
    end

    scenario "失敗した場合はflashメッセージ（alert）が表示されている" do
      fill_in('user[email]',                 with: 'user01@example.com')
      fill_in('user[current_password]',      with: 'password10')
      fill_in('user[password]',              with: 'password02')
      fill_in('user[password_confirmation]', with: 'password02')
      click_button('Update')
      expect(page).to have_text('現在のパスワードは不正な値です')
    end
  end
end
