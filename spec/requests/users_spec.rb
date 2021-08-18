require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "Login前のテスト" do
    context "新規登録画面にアクセスした場合" do
      it "returns http success" do
        get new_user_registration_path
        expect(response).to have_http_status(200)
      end
    end

    context "ログイン画面にアクセスした場合" do
      it "returns http success" do
        get new_user_session_path
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "Login後のテスト" do
    before do
      @user = create(:user)
      sign_in @user
    end

    context "ユーザ一覧画面にアクセスした場合" do
      it "returns http success" do
        get users_path
        expect(response).to have_http_status(200)
      end
    end

    context "マイページにアクセスした場合" do
      it "returns http success" do
        get user_path(@user.id)
        expect(response).to have_http_status(200)
      end
    end

    context "ユーザ編集画面にアクセスした場合" do
      it "returns http success" do
        get edit_user_registration_path
        expect(response).to have_http_status(200)
      end
    end
  end
end
