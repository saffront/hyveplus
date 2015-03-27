require "rails_helper"

RSpec.describe UserSessionsController, type: :routing do
  describe "routing" do

    it "routes to GET #new" do
      expect(get: "/login").to route_to("user_sessions#new")
    end

    it "routes to POST #create" do
      expect(post: "/user_sessions").to route_to("user_sessions#create")
    end

    it "routes to POST #destroy" do
      expect(post: "/logout").to route_to("user_sessions#destroy")
    end

  end
end
