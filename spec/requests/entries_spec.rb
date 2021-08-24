require 'rails_helper'

RSpec.describe "Entries", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/entries/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/entries/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/entries/show"
      expect(response).to have_http_status(:success)
    end
  end

end
