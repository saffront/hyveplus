require "rails_helper"

RSpec.describe UsersController, type: :routing do
  describe "routing" do

    it "routes to GET #show" do
      expect(get: "/my/account/").to route_to("my/accounts#show")
    end

    it "routes to GET #edit_profile" do
      expect(get: "/my/account/edit_profile").to route_to("my/accounts#edit_profile")
    end

    it "routes to PATCH #update_profile" do
      expect(patch: "/my/account/update_profile").to route_to("my/accounts#update_profile")
    end

    it "routes to GET #edit_password" do
      expect(get: "/my/account/edit_password").to route_to("my/accounts#edit_password")
    end

    it "routes to PATCH #update_password" do
      expect(patch: "/my/account/update_password").to route_to("my/accounts#update_password")
    end

    it "routes to DELETE #destroy" do
      expect(delete: "/my/account").to route_to("my/accounts#destroy")
    end
  end
end
