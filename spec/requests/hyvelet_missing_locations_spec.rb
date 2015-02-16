require 'rails_helper'

RSpec.describe "HyveletMissingLocations", :type => :request do
  describe "GET /hyvelet_missing_locations" do
    it "works! (now write some real specs)" do
      get hyvelet_missing_locations_path
      expect(response.status).to be(200)
    end
  end
end
