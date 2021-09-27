require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "コメントを投稿する時" do
    before do
      @post = create(:post)
    end

    context "全ての項目が正しく入力できている場合" do
      it "登録ができる" do
        @post.valid?
        expect(@post).to be_valid
      end
    end

    context "件名が未入力の場合" do
      it "登録ができずエラーメッセージが表示されている" do
        @post.subject = nil
        @post.valid?
        expect(@post).not_to be_valid
        expect(@post.errors.full_messages).to include("件名を入力してください")
      end
    end

    context "件名が50文字以下の場合" do
      it "登録ができる" do
        @post.subject = "a" * 50
        @post.valid?
        expect(@post).to be_valid
      end
    end

    context "件名が51文字以上の場合" do
      it "登録ができずエラーメッセージが表示されている" do
        @post.subject = "a" * 51
        @post.valid?
        expect(@post).not_to be_valid
        expect(@post.errors.full_messages).to include("件名は50文字以内で入力してください")
      end
    end

    context "コメント内容が未入力の場合" do
      it "登録ができずエラーメッセージが表示されている" do
        @post.comment = nil
        @post.valid?
        expect(@post).not_to be_valid
        expect(@post.errors.full_messages).to include("コメント内容を入力してください")
      end
    end

    context "コメント内容が200文字以下の場合" do
      it "登録ができる" do
        @post.comment = "a" * 200
        @post.valid?
        expect(@post).to be_valid
      end
    end

    context "コメント内容が201文字以上の場合" do
      it "登録ができずエラーメッセージが表示されている" do
        @post.comment = "a" * 201
        @post.valid?
        expect(@post).not_to be_valid
        expect(@post.errors.full_messages).to include("コメント内容は200文字以内で入力してください")
      end
    end
  end
end
