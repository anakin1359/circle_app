require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "イベントを登録, 一覧参照する時" do
    before do
      @user = create(:user)
      sign_in @user
    end

    context "マイページ >> イベントを登録する にアクセスした場合" do
      it "returns http success" do
        get new_event_path
        expect(response).to have_http_status(200)
      end
    end

    context "マイページ >> 登録済みイベントを編集する にアクセスした場合" do
      it "returns http success" do
        get events_path
        expect(response).to have_http_status(200)
      end
    end

    context "マイページ >> イベントカレンダーを見る にアクセスした場合" do
      it "returns http success" do
        get events_scheduler_path
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "登録済みイベントを編集する時" do
    before do
      @user = create(:user)
      sign_in @user
      @event = create(:event)
      @event.user_id = @user.id
    end

    context "マイページ >> 登録済みイベントを編集する >> 詳細 にアクセスした場合" do
      it "returns http success" do
        get user_event_path(@event.user_id, @event.id)
        expect(response).to have_http_status(200)
      end
    end

    context "マイページ >> 登録済みイベントを編集する >> 編集 にアクセスした場合" do
      it "returns http success" do
        get edit_event_path(@event.id)
        expect(response).to have_http_status(200)
      end
    end
  end
end
