require "rails_helper"

RSpec.describe PasswordResetsController, type: :routing do
  describe "routing" do

    it "routes to POST #subscribe" do
      expect(post: "/subscribe").to route_to("mailings#sub")
    end

    it "routes to POST #unsubscribe" do
      expect(post: "/unsubscribe").to route_to("mailings#unsub")
    end

  end
end
