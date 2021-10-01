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

      it "氏名の項目が表示されている" do
        expect(page).to have_text('氏名')
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
        expect(page).to have_button('sign up')
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
        expect(page).to have_button('Log in')
      end
    end
  end

  describe "Loginしている時" do
    before do
      @user = create(:user)
      sign_in @user
    end

    context "ナビゲーションリンクに" do
      before do
        visit root_path
      end

      it "新規登録の項目が表示されていない" do
        expect(page).not_to have_text('新規登録')
      end

      it "ログインの項目が表示されていない" do
        expect(page).not_to have_text('ログイン')
      end

      it "マイページの項目が表示されている" do
        expect(page).to have_text('マイページ')
      end

      it "編集画面の項目が表示されている" do
        expect(page).to have_text('ユーザ編集画面')
      end

      it "ログアウトの項目が表示されている" do
        expect(page).to have_text('ログアウト')
      end
    end
  end

  describe "一般ユーザでLoginしている時" do
    before do
      @user = create(:user)
      sign_in @user
    end

    context "ナビゲーションリンクに" do
      before do
        visit root_path
      end

      it "イベント登録の項目が表示されていない" do
        expect(page).not_to have_text('イベント登録')
      end

      it "登録済みイベント一覧の項目が表示されていない" do
        expect(page).not_to have_text('登録済みイベント一覧')
      end

      it "ユーザ一覧の項目が表示されていない" do
        expect(page).not_to have_text('ユーザ一覧')
      end
    end

    context "マイページ上に" do
      before do
        visit user_path(@user.id)
      end

      it "イベント登録の項目が表示されていない" do
        expect(page).not_to have_text('イベント登録')
      end

      it "登録済みイベント一覧の項目が表示されていない" do
        expect(page).not_to have_text('登録済みイベント一覧')
      end

      it "ユーザ一覧の項目が表示されていない" do
        expect(page).not_to have_text('ユーザ一覧')
      end
    end

    context "ユーザ編集画面内に" do
      before do
        visit edit_user_registration_path
      end

      it "メールアドレスの項目が表示されている" do
        expect(page).to have_text('メールアドレス')
      end

      it "現在のパスワードの項目が表示されている" do
        expect(page).to have_text('現在のパスワード')
      end

      it "新しいパスワードの項目が表示されている" do
        expect(page).to have_text('パスワード')
      end

      it "確認用パスワードの項目が表示されている" do
        expect(page).to have_text('確認用パスワード')
      end

      it "更新ボタンが表示されている" do
        expect(page).to have_button('Update')
      end
    end

    context "登録済みイベント一覧ページ上に" do
      before do
        visit events_path
      end

      it "編集ボタンが表示されていない" do
        has_no_link?('編集')
      end

      it "削除ボタンが表示されていない" do
        has_no_link?('削除')
      end
    end

    context "予約履歴一覧ページ上に" do
      before do
        visit user_entries_path(@user.id)
      end

      it "編集ボタンが表示されていない" do
        has_no_link?('編集')
      end

      it "削除ボタンが表示されていない" do
        has_no_link?('削除')
      end
    end
  end

  describe "admin（管理者権限）でLoginしている時" do
    before do
      @user = create(:user)
      @user.admin = true
      sign_in @user
    end

    context "ナビゲーションリンクに" do
      before do
        visit root_path
      end

      it "イベント登録の項目が表示されている" do
        expect(page).to have_text('イベント登録')
      end

      it "登録済みイベント一覧の項目が表示されている" do
        expect(page).to have_text('登録済みイベント一覧')
      end

      it "ユーザ一覧の項目が表示されている" do
        expect(page).to have_text('ユーザ一覧')
      end
    end

    context "マイページ上に" do
      before do
        visit user_path(@user.id)
      end

      it "イベント登録の項目が表示されている" do
        expect(page).to have_text('イベント登録')
      end

      it "登録済みイベント一覧の項目が表示されている" do
        expect(page).to have_text('登録済みイベント一覧')
      end

      it "ユーザ一覧の項目が表示されている" do
        expect(page).to have_text('ユーザ一覧')
      end
    end

    context "登録済みイベント一覧ページ上に" do
      before do
        visit events_path
      end

      it "編集ボタンが表示されている" do
        has_link?('編集')
      end

      it "削除ボタンが表示されている" do
        has_link?('削除')
      end
    end

    context "予約履歴一覧ページ上に" do
      before do
        visit user_entries_path(@user.id)
      end

      it "編集ボタンが表示されている" do
        has_link?('編集')
      end

      it "削除ボタンが表示されている" do
        has_link?('削除')
      end
    end

    # context "ユーザ一覧画面に" do
    #   before do
    #     visit users_path
    #   end

    #   it "ページネーションが表示されている" do
    #     expect(page).to have_text('Previous Label')
    #     expect(page).to have_text('Next Label')
    #   end
    # end
  end

  describe "ユーザの新規登録を行う場合" do
    before do
      visit new_user_registration_path
    end

    scenario "成功した場合はflashメッセージ（success）が表示されている" do
      fill_in('user[name]',                  with: 'user01')
      fill_in('user[email]',                 with: 'user001@example.com')
      fill_in('user[password]',              with: 'password01')
      fill_in('user[password_confirmation]', with: 'password01')
      click_button('sign up')
      expect(page).to have_text('アカウント登録が完了しました')
    end

    scenario "失敗した場合はflashメッセージ（alert）が表示されている" do
      fill_in('user[name]',                  with: 'user01')
      fill_in('user[email]',                 with: 'user001@example.com')
      fill_in('user[password]',              with: 'password01')
      fill_in('user[password_confirmation]', with: 'password10')
      click_button('sign up')
      expect(page).to have_text('エラーが発生したため ユーザ は保存されませんでした')
    end
  end

  # describe "ユーザログインを行う場合" do
  #   before do
  #     @user = create(:user)
  #     visit new_user_session_path
  #   end

  #   scenario "成功した場合はflashメッセージ（success）が表示されている" do
  #     fill_in('user[email]',    with: 'user001@example.com')
  #     fill_in('user[password]', with: 'password01')
  #     click_button('Log in')
  #     expect(page).to have_text('ログインしました')
  #   end

  #   scenario "失敗した場合はflashメッセージ（alert）が表示されている（メールアドレス未入力）" do
  #     fill_in('user[email]',    with: '')
  #     fill_in('user[password]', with: 'password01')
  #     click_button('Log in')
  #     expect(page).to have_text('メールアドレスまたはパスワードが違います')
  #   end

  #   scenario "失敗した場合はflashメッセージ（alert）が表示されている（メールアドレス不一致）" do
  #     fill_in('user[email]',    with: 'user10@example.com')
  #     fill_in('user[password]', with: 'password01')
  #     click_button('Log in')
  #     expect(page).to have_text('メールアドレスまたはパスワードが違います')
  #   end

  #   scenario "失敗した場合はflashメッセージ（alert）が表示されている（パスワード未入力）" do
  #     fill_in('user[email]',    with: 'user01@example.com')
  #     fill_in('user[password]', with: '')
  #     click_button('Log in')
  #     expect(page).to have_text('メールアドレスまたはパスワードが違います')
  #   end

  #   scenario "失敗した場合はflashメッセージ（alert）が表示されている（パスワード不一致）" do
  #     fill_in('user[email]',    with: 'user01@example.com')
  #     fill_in('user[password]', with: 'password10')
  #     click_button('Log in')
  #     expect(page).to have_text('メールアドレスまたはパスワードが違います')
  #   end
  # end

  # describe "ユーザ情報の編集を行う場合" do
  #   before do
  #     @user = create(:user)
  #     sign_in @user
  #     visit edit_user_registration_path
  #   end

  #   scenario "成功した場合はflashメッセージ（success）が表示されている" do
  #     fill_in('user[email]',                 with: 'user001@example.com')
  #     fill_in('user[current_password]',      with: 'password01')
  #     fill_in('user[password]',              with: 'password02')
  #     fill_in('user[password_confirmation]', with: 'password02')
  #     click_button('Update')
  #     expect(page).to have_text('アカウント情報を変更しました')
  #   end

  #   scenario "失敗した場合はflashメッセージ（alert）が表示されている（メールアドレス未入力）" do
  #     fill_in('user[email]',                 with: '')
  #     fill_in('user[current_password]',      with: 'password01')
  #     fill_in('user[password]',              with: 'password02')
  #     fill_in('user[password_confirmation]', with: 'password02')
  #     click_button('Update')
  #     expect(page).to have_text('メールアドレスを入力してください')
  #   end

  #   scenario "失敗した場合はflashメッセージ（alert）が表示されている（メールアドレスフォーマットエラー）" do
  #     fill_in('user[email]',                 with: '?user0*.ex@mple.c$m.')
  #     fill_in('user[current_password]',      with: 'password01')
  #     fill_in('user[password]',              with: 'password02')
  #     fill_in('user[password_confirmation]', with: 'password02')
  #     click_button('Update')
  #     expect(page).to have_text('メールアドレスは不正な値です')
  #   end

  #   scenario "失敗した場合はflashメッセージ（alert）が表示されている（現在のパスワード未入力）" do
  #     fill_in('user[email]',                 with: 'user01@example.com')
  #     fill_in('user[current_password]',      with: '')
  #     fill_in('user[password]',              with: 'password02')
  #     fill_in('user[password_confirmation]', with: 'password02')
  #     click_button('Update')
  #     expect(page).to have_text('パスワードを入力してください')
  #   end

  #   scenario "失敗した場合はflashメッセージ（alert）が表示されている（現在のパスワード不一致）" do
  #     fill_in('user[email]',                 with: 'user01@example.com')
  #     fill_in('user[current_password]',      with: 'password10')
  #     fill_in('user[password]',              with: 'password02')
  #     fill_in('user[password_confirmation]', with: 'password02')
  #     click_button('Update')
  #     expect(page).to have_text('現在のパスワードは不正な値です')
  #   end

  #   scenario "失敗した場合はflashメッセージ（alert）が表示されている（確認用のパスワード不一致）" do
  #     fill_in('user[email]',                 with: 'user01@example.com')
  #     fill_in('user[current_password]',      with: 'password01')
  #     fill_in('user[password]',              with: 'password02')
  #     fill_in('user[password_confirmation]', with: 'password20')
  #     click_button('Update')
  #     expect(page).to have_text('確認用パスワードとパスワードの入力が一致しません')
  #   end
  # end
end
