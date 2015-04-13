require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  #let!(:user) { create(:user) }
  #it { should permit(:email, :username, :first_name, :last_name, :avatar, :password, :password_confirmation).for(:create) }

  before(:each) do
    request.env["HTTP_REFERER"] = "where_user_came_from"
  end

  describe "POST create" do
    context "with VALID user attributes" do
      it "saves the user to the database" do
        expect {
          post :create, user: attributes_for(:user)
        }.to change(User, :count).by(1)
      end

      it "redirects to my/account path" do
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

      it "redirects to :back" do
        expect {
          post :create, user: attributes_for(:user, :invalid_user)
          expect(response).to eq "where_user_came_from"
        }
      end
    end
  end
end
