require "rails_helper"

RSpec.describe HyveletsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/hyvelets").to route_to("hyvelets#index")
    end

    it "routes to #new" do
      expect(:get => "/hyvelets/new").to route_to("hyvelets#new")
    end

    it "routes to #show" do
      expect(:get => "/hyvelets/1").to route_to("hyvelets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/hyvelets/1/edit").to route_to("hyvelets#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/hyvelets").to route_to("hyvelets#create")
    end

    it "routes to #update" do
      expect(:put => "/hyvelets/1").to route_to("hyvelets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/hyvelets/1").to route_to("hyvelets#destroy", :id => "1")
    end

  end
end
