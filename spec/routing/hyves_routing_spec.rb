require "rails_helper"

RSpec.describe HyvesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/hyves").to route_to("hyves#index")
    end

    it "routes to #new" do
      expect(:get => "/hyves/new").to route_to("hyves#new")
    end

    it "routes to #show" do
      expect(:get => "/hyves/1").to route_to("hyves#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/hyves/1/edit").to route_to("hyves#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/hyves").to route_to("hyves#create")
    end

    it "routes to #update" do
      expect(:put => "/hyves/1").to route_to("hyves#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/hyves/1").to route_to("hyves#destroy", :id => "1")
    end

  end
end
