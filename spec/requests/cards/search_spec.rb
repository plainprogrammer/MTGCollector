require "rails_helper"

RSpec.describe "Cards::Searches", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/cards/search/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/cards/search/create"
      expect(response).to have_http_status(:success)
    end
  end
end
