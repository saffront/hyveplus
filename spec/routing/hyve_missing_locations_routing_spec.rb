require "rails_helper"

RSpec.describe HyveMissingLocationsController, type: :routing do
  describe "routing" do

    it "routes to GET #index" do
      expect(get: "/hyve_missing_locations").to route_to("hyve_missing_locations#index")
    end

    it "routes to GET #show" do
      expect(get: "/hyve_missing_locations/1").to route_to("hyve_missing_locations#show", :id => "1")
    end

    it "routes to GET #new" do
      expect(get: "/hyve_missing_locations/new").to route_to("hyve_missing_locations#new")
    end

    it "routes to POST #create" do
      expect(post: "/hyve_missing_locations").to route_to("hyve_missing_locations#create")
    end

    it "routes to GET #edit" do
      expect(get: "/hyve_missing_locations/1/edit").to route_to("hyve_missing_locations#edit", :id => "1")
    end

    it "routes to PUT #update" do
      expect(put: "/hyve_missing_locations/1").to route_to("hyve_missing_locations#update", :id => "1")
    end

    it "routes to PUT #update" do
      expect(put: "/hyve_missing_locations/1").to route_to("hyve_missing_locations#update", :id => "1")
    end

    it "routes to DELETE #destroy" do
      expect(delete: "/hyve_missing_locations/1").to route_to("hyve_missing_locations#destroy", :id => "1")
    end

  end
end
