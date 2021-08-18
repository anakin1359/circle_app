require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "サイトアクセス直後" do
    context "ホーム画面にアクセスした場合" do
      it "returns http success" do
        get root_path
        expect(response).to have_http_status(200)
      end
    end

    context "問い合わせ画面にアクセスした場合" do
      it "returns http success" do
        get contact_path
        expect(response).to have_http_status(200)
      end
    end
  end
end
