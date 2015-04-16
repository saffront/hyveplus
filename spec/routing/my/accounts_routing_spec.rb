require "rails_helper"

RSpec.describe My::AccountsController, type: :routing do
  describe "routing" do

    it "routes to GET #show" do
      expect(get: "/my/account/").to route_to("my/accounts#show")
    end

    it "routes to PATCH #update_profile" do
      expect(patch: "/my/account/update_profile").to route_to("my/accounts#update_profile")
    end

    it "routes to PATCH #update_password" do
      expect(patch: "/my/account/update_password").to route_to("my/accounts#update_password")
    end

    it "routes to PATCH #update_hyve" do
      expect(patch: "/my/account/update_hyve").to route_to("my/accounts#update_hyve")
    end

    it "routes to PATCH #subscribe" do
      expect(patch: "/my/account/subscribe").to route_to("my/accounts#subscribe")
    end

    it "routes to PATCH #unsubscribe" do
      expect(patch: "/my/account/unsubscribe").to route_to("my/accounts#unsubscribe")
    end
  end
end
