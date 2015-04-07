require "rails_helper"

RSpec.describe Admin::HyvesController, type: :routing do
  describe "routing" do

    it "routes to GET #index" do
      expect(get: "/admin/hyves").to route_to("admin/hyves#index")
    end

    it "routes to GET #show" do
      expect(get: "/admin/hyves/1").to route_to("admin/hyves#show", id: "1")
    end

    it "routes to GET #edit" do
      expect(get: "/admin/hyves/1/edit").to route_to("admin/hyves#edit", id: "1")
    end

    it "routes to PATCH #update" do
      expect(patch: "/admin/hyves/1").to route_to("admin/hyves#update", id: "1")
    end

    it "routes to PUT #update" do
      expect(put: "/admin/hyves/1").to route_to("admin/hyves#update", id: "1")
    end

    it "routes to DELETE #destroy" do
      expect(delete: "/admin/hyves/1").to route_to("admin/hyves#destroy", id: "1")
    end
  end
end
