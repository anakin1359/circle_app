require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_user_registration_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/users/show"
      expect(response).to have_http_status(200)
    end
  end

  # describe "GET /edit" do
  #   it "returns http success" do
  #     get "/users/edit"
  #     expect(response).to have_http_status(200)
  #   end
  # end
end
