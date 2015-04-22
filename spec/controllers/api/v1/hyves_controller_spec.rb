require 'rails_helper'

RSpec.describe Api::V1::HyvesController, type: :controller do

  let!(:user) { create(:user, :with_api_token) } 
  let!(:hyve) { create(:hyve, user: user) } 

  before do
    request.headers["X-hyve-token"] = user.api_token
  end

  it { should permit(:name, :distance, :uuid, :image).for(:create) }
  it { should permit(:name, :distance, :uuid, :image).for(:update, params: { id: hyve.uuid } ) }

  describe "GET index" do
    xit "render JSON object of all of user's hyves as @hyves" do
      get :index, format: :json
      expect(response).to be_success
      json = JSON.parse(response.body)
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
