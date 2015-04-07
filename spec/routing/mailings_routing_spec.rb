require "rails_helper"

RSpec.describe MailingsController, type: :routing do
  describe "routing" do

    it "routes to POST #sub_adopters" do
      expect(post: "/subscribe_early_adopters").to route_to("mailings#sub_adopters")
    end

    it "routes to POST #sub_users" do
      expect(post: "/subscribe").to route_to("mailings#sub_users")
    end

    it "routes to POST #unsub_users" do
      expect(post: "/unsubscribe").to route_to("mailings#unsub_users")
    end
  end
end
