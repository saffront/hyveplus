require 'rails_helper'

RSpec.describe PagesController, :type => :controller do
  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      expect(response).to be_success
    end
  end

  ###About###
  describe "GET 'company'" do
    it "returns http success" do
      get 'company'
      expect(response).to be_success
    end
  end

  describe "GET 'product'" do
    it "returns http success" do
      get 'product'
      expect(response).to be_success
    end
  end

  describe "GET 'press'" do
    it "returns http success" do
      get 'press'
      expect(response).to be_success
    end
  end
  ###End###

  describe "GET 'order'" do
    it "returns http success" do
      get 'order'
      expect(response).to be_success
    end
  end
end
