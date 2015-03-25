require "rails_helper"

RSpec.describe HyveMissingLocationsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/hyve_missing_locations").to route_to("hyve_missing_locations#index")
    end

    it "routes to #new" do
      expect(:get => "/hyve_missing_locations/new").to route_to("hyve_missing_locations#new")
    end

    it "routes to #show" do
      expect(:get => "/hyve_missing_locations/1").to route_to("hyve_missing_locations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/hyve_missing_locations/1/edit").to route_to("hyve_missing_locations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/hyve_missing_locations").to route_to("hyve_missing_locations#create")
    end

    it "routes to #update" do
      expect(:put => "/hyve_missing_locations/1").to route_to("hyve_missing_locations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/hyve_missing_locations/1").to route_to("hyve_missing_locations#destroy", :id => "1")
    end

  end
end
