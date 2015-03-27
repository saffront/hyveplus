require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET new" do
    before do
      get :new
    end

    it "assign a new user to @user" do
      expect(assigns(:user)).to be_a_new(User)
    end

    it "renders the :new template" do
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    context "with VALID user attributes" do
      it "saves the user to the database" do
        expect {
          post :create, user: attributes_for(:user)
        }.to change(User, :count).by(1)
      end

      it "redirects to user path" do
        post :create, user: attributes_for(:user)
        expect(response).to redirect_to my_account_url 
      end
    end

    context "with INVALID user attributes" do
      it "does not save the user to the database" do
        expect {
          post :create, user: attributes_for(:user, :invalid_user)
        }.to_not change(User, :count)
      end

      it "re-renders :new template" do
        post :create, user: attributes_for(:user, :invalid_user)
        expect(response).to render_template :new
      end
    end
  end
end
