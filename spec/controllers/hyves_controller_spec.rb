require 'rails_helper'

RSpec.describe HyvesController, type: :controller do

  render_views

  let!(:user) { create(:user) }
  let!(:hyve1) { create(:hyve, user: user) }
  let!(:hyve2) { create(:hyve, user: user) }

  describe "GET index" do
    before { get :index }
    it "assigns all of user's hyve(s) to @hyves" do
      expect(user.hyves.first).to eql hyve1
      expect(user.hyves.last).to eql hyve2
    end
  end

  #describe "GET show" do
    #before { get :show, id: hyve1.id }

    #it "assigns the hyve to @hyve" do
      #expect(assigns(:hyve1)).to eq hyve1 
    #end

    #it "renders the :show template" do
      #expect(response).to render_template :show
    #end
  #end

  #describe "GET edit" do
    #before { get :edit, id: hyve1 }

    #it "renders the :edit template" do
      #expect(response).to render_template :edit
    #end
  #end

  #describe "PATCH update" do
    #context "with VALID hyve attributes" do
      #it "gets the hyve" do
      #end 

      #it "changes @hyve's attributes" do
      #end

      #it "redirect to hyve_path" do
      #end
    #end

    #context "with INVALID hyve attributes" do
      #it "does not change @hyve's attributes" do
      #end

      #it "re-renders :edit template" do
      #end
    #end
  #end

  #describe "DELETE destroy" do
  #end
end
