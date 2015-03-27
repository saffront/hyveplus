require "rails_helper"

RSpec.describe Api::V1::HyvesController, type: :routing do
  describe "routing" do

    it "routes to GET #index" do
      expect(get: "/api/v1/hyves").to route_to("api/v1/hyves#index")
    end

    it "routes to GET #show" do
      expect(get: "/api/v1/hyves/1").to route_to("api/v1/hyves#show", :id => "1")
    end

    it "routes to GET #new" do
      expect(get: "/api/v1/hyves/new").to route_to("api/v1/hyves#new")
    end

    it "routes to POST #create" do
      expect(post: "/api/v1/hyves").to route_to("api/v1/hyves#create")
    end

    it "routes to GET #edit" do
      expect(get: "/api/v1/hyves/1/edit").to route_to("api/v1/hyves#edit", :id => "1")
    end

    it "routes to PUT #update" do
      expect(put: "/api/v1/hyves/1").to route_to("api/v1/hyves#update", :id => "1")
    end

    it "routes to PATCH #update" do
      expect(patch: "/api/v1/hyves/1").to route_to("api/v1/hyves#update", :id => "1")
    end

    it "routes to DELETE #destroy" do
      expect(delete: "/api/v1/hyves/1").to route_to("api/v1/hyves#destroy", :id => "1")
    end

  end
end
