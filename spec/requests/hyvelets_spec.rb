require 'rails_helper'

RSpec.describe "Hyvelets", :type => :request do
  describe "GET /hyvelets" do
    it "works! (now write some real specs)" do
      get hyvelets_path
      expect(response.status).to be(200)
    end
  end
end
