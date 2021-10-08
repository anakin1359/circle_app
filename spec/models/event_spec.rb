require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "イベントを登録する時" do
    before do
      @event = create(:event)
    end

    context "全ての項目が正しく入力できている場合" do
      it "登録ができる" do
        @event.valid?
        expect(@event).to be_valid
      end

      # it "登録日が降順（新しい順）に登録されている" do
      #   #
      # end
    end

    context "イベント名が未入力の場合" do
      it "登録ができずエラーメッセージが表示されている" do
        @event.title = nil
        @event.valid?
        expect(@event).not_to be_valid
        expect(@event.errors.full_messages).to include("タイトルを入力してください")
      end
    end

    context "イベント名が50文字以下の場合" do
      it "登録ができる" do
        @event.title = "a" * 50
        @event.valid?
        expect(@event).to be_valid
      end
    end

    context "イベント名が51文字以上の場合" do
      it "登録ができずエラーメッセージが表示されている" do
        @event.title = "a" * 51
        @event.valid?
        expect(@event).not_to be_valid
        expect(@event.errors.full_messages).to include("タイトルは50文字以内で入力してください")
      end
    end

    context "イベント概要が未入力の場合" do
      it "登録ができずエラーメッセージが表示されている" do
        @event.introduction = nil
        @event.valid?
        expect(@event).not_to be_valid
        expect(@event.errors.full_messages).to include("イベント概要を入力してください")
      end
    end

    context "イベント概要が300文字以下の場合" do
      it "登録ができる" do
        @event.introduction = "a" * 300
        @event.valid?
        expect(@event).to be_valid
      end
    end

    context "イベント概要が301文字以上の場合" do
      it "登録ができずエラーメッセージが表示されている" do
        @event.introduction = "a" * 301
        @event.valid?
        expect(@event).not_to be_valid
        expect(@event.errors.full_messages).to include("イベント概要は300文字以内で入力してください")
      end
    end

    context "開始日が未入力の場合" do
      it "登録ができずエラーメッセージが表示されている" do
        @event.start_time = nil
        @event.valid?
        expect(@event).not_to be_valid
        expect(@event.errors.full_messages).to include("開始日を入力してください")
      end
    end

    context "終了日が未入力の場合" do
      it "登録ができずエラーメッセージが表示されている" do
        @event.end_time = nil
        @event.valid?
        expect(@event).not_to be_valid
        expect(@event.errors.full_messages).to include("終了日を入力してください")
      end
    end

    context "終了日が開始日よりも前の日付の場合" do
      it "登録ができずエラーメッセージが表示されている" do
        dt = DateTime.now
        @event.start_time = dt
        @event.end_time = dt - Rational(1, 24 * 60)
        @event.valid?
        expect(@event).not_to be_valid
        expect(@event.errors.full_messages).to include("終了日は開始日より前の日時は指定できません")
      end
    end

    context "募集人数が未入力の場合" do
      it "登録ができずエラーメッセージが表示されている" do
        @event.entry_count = nil
        @event.valid?
        expect(@event).not_to be_valid
        expect(@event.errors.full_messages).to include("参加者の人数（上限値）を入力してください")
      end
    end

    context "料金が未入力の場合" do
      it "登録ができずエラーメッセージが表示されている" do
        @event.event_price = nil
        @event.valid?
        expect(@event).not_to be_valid
        expect(@event.errors.full_messages).to include("料金を入力してください")
      end
    end

    context "住所が未入力の場合" do
      it "登録ができずエラーメッセージが表示されている" do
        @event.address = nil
        @event.valid?
        expect(@event).not_to be_valid
        expect(@event.errors.full_messages).to include("開催場所を入力してください")
      end
    end

    context "住所が137文字以下の場合" do
      it "登録ができる" do
        @event.address = "a" * 137
        @event.valid?
        expect(@event).to be_valid
      end
    end

    context "住所が138文字以上の場合" do
      it "登録ができずエラーメッセージが表示されている" do
        @event.address = "a" * 301
        @event.valid?
        expect(@event).not_to be_valid
        expect(@event.errors.full_messages).to include("開催場所は137文字以内で入力してください")
      end
    end

    # context "住所が正しく入力されている場合" do
    #   it "入力された住所に対応する緯度/経度の情報を取得している" do
    #     expect(@event.latitude).to eq 35.6972683
    #     expect(@event.longitude).to eq 139.7615239
    #   end
    # end
  end
end
