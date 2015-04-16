require "rails_helper"

RSpec.describe Api::V1::UserSessionsController, type: :routing do
  describe "routing" do

    it "routes to POST #create" do
      expect(post: "/api/v1/user_sessions").to route_to("api/v1/user_sessions#create")
    end

    it "routes to POST #register" do
      expect(post: "/api/v1/register").to route_to("api/v1/user_sessions#register")
    end

    it "routes to DELETE #destroy" do
      expect(delete: "/api/v1/user_sessions/1").to route_to("api/v1/user_sessions#destroy", :id => "1")
    end
  end
end
