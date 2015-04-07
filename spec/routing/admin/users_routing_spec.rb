require "rails_helper"

RSpec.describe Admin::UsersController, type: :routing do
  describe "routing" do

    it "routes to GET #index" do
      expect(get: "/admin/users").to route_to("admin/users#index")
    end

    it "routes to GET #show" do
      expect(get: "/admin/users/1").to route_to("admin/users#show", id: "1")
    end

    it "routes to GET #edit" do
      expect(get: "/admin/users/1/edit").to route_to("admin/users#edit", id: "1")
    end

    it "routes to PATCH #update" do
      expect(patch: "/admin/users/1").to route_to("admin/users#update", id: "1")
    end

    it "routes to PUT #update" do
      expect(put: "/admin/users/1").to route_to("admin/users#update", id: "1")
    end

    it "routes to DELETE #destroy" do
      expect(delete: "/admin/users/1").to route_to("admin/users#destroy", id: "1")
    end
  end
end
