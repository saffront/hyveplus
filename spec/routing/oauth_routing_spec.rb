require "rails_helper"

RSpec.describe OauthController, type: :routing do
  describe "routing" do

    it "routes to POST #callback" do
      expect(post: "/oauth/callback").to route_to("oauth#callback")
    end

    it "routes to GET #callback" do
      expect(get: "/oauth/callback").to route_to("oauth#callback")
    end

    it "routes to GET #oauth" do
      expect(get: "/oauth/facebook").to route_to("oauth#oauth", provider: "facebook")
    end

  end
end
