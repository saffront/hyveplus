require "rails_helper"

RSpec.describe MailingsController, type: :routing do
  describe "routing" do

    it "routes to POST #sub_adopters" do
      expect(post: "/subscribe_early_adopters").to route_to("mailings#sub_adopters")
    end
  end
end
