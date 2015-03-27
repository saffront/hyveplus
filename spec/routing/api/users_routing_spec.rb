require "rails_helper"

RSpec.describe Api::V1::UsersController, type: :routing do
  describe "routing" do

    it "routes to GET #show" do
      expect(get: "/api/v1/users/1").to route_to("api/v1/users#show", :id => "1")
    end
  end
end
