require "rails_helper"

RSpec.describe MasterPinsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/master_pins").to route_to("master_pins#index")
    end

    it "routes to #new" do
      expect(:get => "/master_pins/new").to route_to("master_pins#new")
    end

    it "routes to #show" do
      expect(:get => "/master_pins/1").to route_to("master_pins#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/master_pins/1/edit").to route_to("master_pins#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/master_pins").to route_to("master_pins#create")
    end

    it "routes to #update" do
      expect(:put => "/master_pins/1").to route_to("master_pins#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/master_pins/1").to route_to("master_pins#destroy", :id => "1")
    end

  end
end
