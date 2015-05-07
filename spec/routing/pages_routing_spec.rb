require "rails_helper"

RSpec.describe PagesController, type: :routing do
  describe "routing" do

    it "routes to GET #home" do
      expect(get: "/").to route_to("pages#home")
    end

    it "routes to GET #team" do
      expect(get: "/team").to route_to("pages#team")
    end

    it "routes to GET #press" do
      expect(get: "/press").to route_to("pages#press")
    end

    it "routes to GET #product" do
      expect(get: "/product").to route_to("pages#product")
    end

    it "routes to GET #kickstarter" do
      expect(get: "/kickstarter").to route_to("pages#kickstarter")
    end

    it "routes to GET #faq" do
      expect(get: "/faq").to route_to("pages#faq")
    end

    it "routes to GET #contact" do
      expect(get: "/contact").to route_to("pages#contact")
    end

    it "routes to GET #tnc" do
      expect(get: "/tnc").to route_to("pages#tnc")
    end
  end
end
