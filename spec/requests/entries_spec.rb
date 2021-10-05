require 'rails_helper'

RSpec.describe "Entries", type: :request do
  describe "イベントに参加する時（entry/new）" do
    before do
      @user = create(:user)
      @event = create(:event)
      sign_in @user
    end

    context "マイページ >> 対象イベントを選択 >> イベントに参加する にアクセスした場合" do
      it "returns http success" do
        get new_event_entry_path(@event.id)
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "予約済みイベント一覧を参照する時（entry/index）" do
    before do
      @user = create(:user)
      sign_in @user
    end

    context "マイページ >> 予約履歴を確認する にアクセスした場合" do
      it "returns http success" do
        get user_entries_path(@user.id)
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "予約済みイベントの詳細を参照する時（entry/show）" do
    before do
      @user = create(:user)
      sign_in @user

      @event = Event.new(
        title: "test_title",
        introduction: "test_introduction",
        entry_count: 5,
        event_price: 500,
        start_time: Date.today.beginning_of_week,
        end_time: Date.today.end_of_week,
        address: "東京都千代田区神田駿河台1-1",
        event_icon: nil,
        user_id: "#{@user.id}",
      )
      @event.save

      @entry = Entry.new(
        entry_name: "test_entry",
        entry_count: 3,
        entry_price: 1500,
        user_id: "#{@event.user_id}",
        event_id: "#{@event.id}"
      )
      @entry.save
    end

    context "マイページ >> 予約履歴を確認する >> 詳細 にアクセスした場合" do
      it "returns http success" do
        get user_entry_path(@entry.user_id, @entry.id)
        expect(response).to have_http_status(200)
      end
    end
  end
end
