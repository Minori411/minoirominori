require 'rails_helper'

RSpec.describe "Mies", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/mies/show"
      expect(response).to have_http_status(:success)
    end
  end

end
