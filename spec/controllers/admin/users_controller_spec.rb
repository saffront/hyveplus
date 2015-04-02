require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  let!(:users) { 4.times.map { create(:user, :multiple_admins) } } 


  describe "GET index" do
    before(:each) do
      users.each do |u|
        login_user(u)
      end
      get :index
    end

    it "assign all users to @user" do
      expect(assigns(:users)).to eq users
    end

    it "renders the :index template" do
      expect(response).to render_template :index
    end
  end
end
