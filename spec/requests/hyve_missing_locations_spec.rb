require 'rails_helper'

RSpec.describe "HyveMissingLocations", :type => :request do
  describe "GET /hyve_missing_locations" do
    it "works! (now write some real specs)" do
      get hyve_missing_locations_path
      expect(response.status).to be(200)
    end
  end
end
