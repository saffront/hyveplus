require "rails_helper"

RSpec.describe MasterPinsController, :type => :routing do
  describe "routing" do

    it "routes to GET #index" do
      expect(get: "/master_pins").to route_to("master_pins#index")
    end

    it "routes to GET #show" do
      expect(get: "/master_pins/1").to route_to("master_pins#show", :id => "1")
    end

    it "routes to GET #new" do
      expect(get: "/master_pins/new").to route_to("master_pins#new")
    end

    it "routes to POST #create" do
      expect(post: "/master_pins").to route_to("master_pins#create")
    end

    it "routes to GET #edit" do
      expect(get: "/master_pins/1/edit").to route_to("master_pins#edit", :id => "1")
    end

    it "routes to PATCH #update" do
      expect(patch: "/master_pins/1").to route_to("master_pins#update", :id => "1")
    end

    it "routes to PUT #update" do
      expect(put: "/master_pins/1").to route_to("master_pins#update", :id => "1")
    end

    it "routes to DELETE #destroy" do
      expect(delete: "/master_pins/1").to route_to("master_pins#destroy", :id => "1")
    end

  end
end
