require "rails_helper"

RSpec.describe HyvesController, type: :routing do
  describe "routing" do

    it "routes to GET #index" do
      expect(get: "/hyves").to route_to("hyves#index")
    end

    it "routes to GET #show" do
      expect(get: "/hyves/1").to route_to("hyves#show", :id => "1")
    end

    it "routes to GET #edit" do
      expect(get: "/hyves/1/edit").to route_to("hyves#edit", :id => "1")
    end

    it "routes to PUT #update" do
      expect(put: "/hyves/1").to route_to("hyves#update", :id => "1")
    end

    it "routes to PATCH #update" do
      expect(patch: "/hyves/1").to route_to("hyves#update", :id => "1")
    end

    it "routes to DELETE #destroy" do
      expect(delete: "/hyves/1").to route_to("hyves#destroy", :id => "1")
    end

  end
end
