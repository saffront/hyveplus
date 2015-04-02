require 'rails_helper'

RSpec.describe Admin::HyvesController, type: :controller do
  let!(:hyves) { 4.times.map { create(:hyve) } } 
  let!(:user) { create(:user, :admin) }


  describe "GET index" do
    before(:each) do
      login_user(user)
      get :index
    end

    it "assign all hyves to @hyves" do
      expect(assigns(:hyves)).to eq hyves
    end

    it "renders the :index template" do
      expect(response).to render_template :index
    end
  end
end
