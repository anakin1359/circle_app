require 'rails_helper'

RSpec.describe User, type: :model do
  describe "新規登録する時" do
    before do
      @user = create(:user)
    end

    context "全ての項目が正しく入力できている場合" do
      it "登録ができる" do
        @user.valid?
        expect(@user).to be_valid
      end

      it "メールアドレスが小文字に変換されている" do
        @email_upcase_user = User.new(
          name: "upcase_user01",
          email: "UPCASE_USER01@EXAMPLE.COM",
          password: "password01",
          password_confirmation: "password01"
        )
        @email_upcase_user.save
        @email_upcase_user.valid?
        expect(@email_upcase_user).to be_valid
        expect(@email_upcase_user.email).to eq("upcase_user01@example.com")
      end
    end

    context "名前が未入力の場合" do
      it "登録ができずエラーメッセージが表示されている" do
        @user.name = nil
        @user.valid?
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include("氏名を入力してください")
      end
    end

    context "名前が50文字以下の場合" do
      it "登録ができる" do
        @user.name = "a" * 50
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context "氏名が51文字以上の場合" do
      it "登録ができずエラーメッセージが表示されている" do
        @user.name = "a" * 51
        @user.valid?
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include("氏名は50文字以内で入力してください")
      end
    end

    context "メールアドレス未入力の場合" do
      it "登録ができずエラーメッセージが表示されている" do
        @user.email = nil
        @user.valid?
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end
    end

    context "メールアドレスのフォーマットが不適切な場合" do
      it "登録ができずエラーメッセージが表示されている" do
        @user.email = "?user0*.ex@mple.c$m."
        @user.valid?
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
      end
    end

    context "メールアドレスが255文字以下の場合" do
      it "登録ができずエラーメッセージが表示されている" do
        @user.email = ("a" * 243) + "@example.com"
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context "メールアドレスが256文字以上の場合" do
      it "登録ができずエラーメッセージが表示されている" do
        @user.email = ("a" * 244) + "@example.com"
        @user.valid?
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include("メールアドレスは255文字以内で入力してください")
      end
    end

    context "メールアドレスが重複した場合" do
      it "登録ができずエラーメッセージが表示されている" do
        @sample_user = User.new(
          name: "test01",
          email: "user01@example.com",
          password: "password01",
          password_confirmation: "password01"
        )
        @email_duplication_user = User.new(
          name: "test10",
          email: "user01@example.com",
          password: "password01",
          password_confirmation: "password01"
        )
        @sample_user.save
        @email_duplication_user.save
        @email_duplication_user.valid?
        expect(@email_duplication_user).not_to be_valid
        expect(@email_duplication_user.errors.full_messages).to include("メールアドレスはすでに存在します")
      end
    end

    context "パスワードが未入力の場合" do
      it "登録ができずエラーメッセージが表示されている" do
        @user.password = nil
        @user.valid?
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
    end

    context "パスワードと確認用パスワードが一致していない場合" do
      it "登録ができずエラーメッセージが表示されている" do
        @pw_different_user = User.new(
          name: "user02",
          email: "user02@example.com",
          password: "password01",
          password_confirmation: "password10"
        )
        @pw_different_user.save
        @pw_different_user.valid?
        expect(@pw_different_user).not_to be_valid
        expect(@pw_different_user.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
      end
    end

    context "パスワードが8文字以上、128文字以下の場合" do
      it "8文字のパスワードは登録ができる" do
        @user.password = "a" * 8
        @user.password_confirmation = "a" * 8
        @user.valid?
        expect(@user).to be_valid
      end

      it "128文字のパスワードは登録ができる" do
        @user.password = "a" * 128
        @user.password_confirmation = "a" * 128
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context "パスワードが7文字以下、または129文字以上の場合" do
      it "7文字のパスワードは登録ができずエラーメッセージが表示されている" do
        @user.password = "a" * 7
        @user.password_confirmation = "a" * 7
        @user.valid?
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include("パスワードは8文字以上で入力してください")
      end

      it "129文字のパスワードは登録ができずエラーメッセージが表示されている" do
        @user.password = "a" * 129
        @user.password_confirmation = "a" * 129
        @user.valid?
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include("パスワードは128文字以内で入力してください")
      end
    end
  end
end
