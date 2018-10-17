require 'rails_helper'

RSpec.describe "Locations", type: :request do
  describe "GET /locations" do
    it "renders successfully" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end
