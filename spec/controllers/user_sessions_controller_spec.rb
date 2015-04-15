require 'rails_helper'

RSpec.describe UserSessionsController, type: :controller do

  let!(:user) { create :user } 
  before do
    request.env["HTTP_REFERER"] = "where_user_came_from"
  end

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

  #describe "POST create" do
    #context "with VALID login credentials" do
      #it "login the user" do
        #@user = login_user(user)
        #expect(@user). to eql user
      #end

      #it "redirects to back or to user path" do
        #login_user(user)
        #expect(response).to redirect_to my_account_url(user) || "where_user_came_from" 
      #end
    #end

    #context "with INVALID login credentials" do
      #it "does not login the user to the database" do
        #expect {
          #post :create, user: attributes_for(:user, :invalid_user)
        #}.to_not change(User, :count)
      #end

     #it "redirects to back" do
        #post :create, user: attributes_for(:user, :invalid_user)
        #expect(response).to render_template :new
      #end
    #end
  #end


  describe "POST destroy" do
    before { login_user(user) }
    it "returns http success" do
      post :destroy
      expect(flash[:success]).to be_present 
      expect(response).to redirect_to root_url
    end
  end
end
