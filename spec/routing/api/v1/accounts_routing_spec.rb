require "rails_helper"

RSpec.describe Api::V1::AccountsController, type: :routing do
  describe "routing" do

    it "routes to GET #show" do
      expect(get: "/api/v1/account").to route_to("api/v1/accounts#show")
    end

    it "routes to PATCH #update" do
      expect(patch: "/api/v1/account").to route_to("api/v1/accounts#update")
    end

    it "routes to PUT #update" do
      expect(put: "/api/v1/account").to route_to("api/v1/accounts#update")
    end

  end
end
