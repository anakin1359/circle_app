require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User_modelのテスト" do
    it "氏名, メールアドレス, パスワード(確認含む)が全て入力されている" do
      user = User.new(
        name:     "anakin",
        email:    "anakin123@gmail.com",
        # password: "password00",
        # password_confirmation: "password00",
      )
      expect(user).to be_valid
    end

    it "氏名未入力の場合は無効としている" do
      user = User.new(name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
    
    it "氏名が51文字以上の場合は無効としている" do
      user = User.new(name: "a" * 51)
      user.valid?
      expect(user.errors[:name]).to include("is too long (maximum is 50 characters)")
    end
    
    it "メールアドレス未入力の場合は無効としている" do
      user = User.new(email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "メールアドレスが256文字以上の場合は無効としている" do
      user = User.new(email: "a" * 256)
      user.valid?
      expect(user.errors[:email]).to include("is too long (maximum is 255 characters)")
    end
    
    it "メールアドレスのフォーマットに合致しない場合は無効としている" do
      user = User.new(email: "test001@examole.com.")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    # it "パスワード未入力の場合は無効としている" do
    #   #
    # end

    # it "パスワード（確認）未入力の場合は無効としている" do
    #   #
    # end

    # it "重複したメールアドレスの場合は無効としている" do
    #   #
    # end
  end
end
