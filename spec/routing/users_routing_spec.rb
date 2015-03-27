require "rails_helper"

RSpec.describe UsersController, type: :routing do
  describe "routing" do

    it "routes to GET #new" do
      expect(get: "/users/new").to route_to("users#new")
    end

    it "routes to GET #show" do
      expect(get: "/users/1").to route_to("users#show", id: "1")
    end

    it "routes to POST #create" do
      expect(post: "/users").to route_to("users#create")
    end

    it "routes to GET #activate" do
      expect(get: "/users/1/activate").to route_to("users#activate", id: "1")
    end

  end
end
