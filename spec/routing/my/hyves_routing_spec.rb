require "rails_helper"

RSpec.describe My::HyvesController, type: :routing do
  describe "routing" do

    it "routes to GET #show" do
      expect(get: "/my/hyves/1").to route_to("my/hyves#show", :id => "1")
    end

    it "routes to GET #edit" do
      expect(get: "/my/hyves/1/edit").to route_to("my/hyves#edit", :id => "1")
    end

    it "routes to PUT #update" do
      expect(put: "/my/hyves/1").to route_to("my/hyves#update", :id => "1")
    end

    it "routes to PATCH #update" do
      expect(patch: "/my/hyves/1").to route_to("my/hyves#update", :id => "1")
    end

    it "routes to DELETE #destroy" do
      expect(delete: "/my/hyves/1").to route_to("my/hyves#destroy", :id => "1")
    end
  end
end
