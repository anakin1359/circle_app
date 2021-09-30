require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe "イベントに参加する時" do
    before do
      @entry = create(:entry)
    end

    context "全ての項目が正しく入力できている場合" do
      it "登録ができる" do
        @entry.valid?
        expect(@entry).to be_valid
      end
    end

    context "参加者の氏名が未入力の場合" do
      it "登録ができずエラーメッセージが表示されている" do
        @entry.entry_name = nil
        @entry.valid?
        expect(@entry).not_to be_valid
        expect(@entry.errors.full_messages).to include("参加者のお名前を入力してください")
      end
    end

    context "参加者の人数が未入力の場合" do
      it "登録ができずエラーメッセージが表示されている" do
        @entry.entry_count = nil
        @entry.valid?
        expect(@entry).not_to be_valid
        expect(@entry.errors.full_messages).to include("参加者（人）を入力してください")
      end
    end

    context "料金が未入力の場合" do
      it "登録ができずエラーメッセージが表示されている" do
        @entry.entry_price = nil
        @entry.valid?
        expect(@entry).not_to be_valid
        expect(@entry.errors.full_messages).to include("料金（円）を入力してください")
      end
    end
  end
end
