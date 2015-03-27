require "rails_helper"

RSpec.describe HyvesController, type: :routing do
  describe "routing" do

    it "routes to POST #create" do
      expect(post: "/api/v1/user_sessions").to route_to("api/v1/user_sessions#create")
    end

    it "routes to DELETE #destroy" do
      expect(delete: "/api/v1/user_sessions/1").to route_to("api/v1/user_sessions#destroy", :id => "1")
    end

  end
end
