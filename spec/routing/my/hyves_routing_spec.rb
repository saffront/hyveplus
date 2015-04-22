require "rails_helper"

RSpec.describe My::HyvesController, type: :routing do
  describe "routing" do

    it "routes to PATCH #update_hyve" do
      expect(patch: "/my/hyves/hyve-001").to route_to("my/hyves#update", id: "hyve-001")
    end

    it "routes to PUT #update_hyve" do
      expect(patch: "/my/hyves/hyve-001").to route_to("my/hyves#update", id: "hyve-001")
    end
  end
end
