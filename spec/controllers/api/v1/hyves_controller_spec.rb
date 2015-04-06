require 'rails_helper'

RSpec.describe Api::V1::HyvesController, type: :controller do
  let!(:user) { create(:user, :with_api_token) } 

  before { request.headers["X-hyve-token"] = user.api_token }

  describe "GET index" do
    xit "render JSON object of all of user's hyves as @hyves" do
      get :index, format: :json
      expect(response).to be_success
      json = JSON.parse(response.body)
      p json.inspect
      expect(json["hyves"]).should have(2).items
    end 
  end

  #describe "GET show" do
  #end

  #describe "POST create" do

  #end

  #describe "PATCH update" do
    #context "with VALID attributes"do
      #xit "" do
      #end
    #end

    #context "with INVALID attributes" do
      #xit "" do
      #end
    #end
  #end

  #describe "DELETE destroy" do
  #end
end
