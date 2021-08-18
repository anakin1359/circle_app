require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "全画面共通のヘルパーメソッドを使用" do
    context "ページタイトルが存在する場合" do
      it "「full_title」 、及び 「サークル運営サイト」の両方が表示されている" do
        expect(full_title("title")).to eq "title | サークル運営サイト"
      end
    end

    context "ページタイトルが存在しない場合" do
      it "「サークル運営サイト」のみが表示されている" do
        expect(full_title(" ")).to eq "サークル運営サイト"
      end
    end

    context "引数の「page_title」がnilだった場合" do
      it "「サークル運営サイト」のみが表示されている" do
        expect(full_title(nil)).to eq "サークル運営サイト"
      end
    end
  end
end
