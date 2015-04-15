require 'rails_helper'

RSpec.describe My::AccountsController, type: :controller do

  let!(:user) { create :user } 

  before do
    login_user(user)
  end

  it { should permit(:email, :first_name, :last_name, :avatar, :username).for(:update_profile, verb: :patch, params: { id: user.id } ) }
  it { should permit(:password, :password_confirmation).for(:update_password, verb: :patch, params: { id: user.id } ) }

  describe "GET show" do
    before { get :show, id: user }

    it "assigns the current_user to @user" do
      expect(assigns(:user)).to eq user 
    end

    it "renders the :show template" do
      expect(response).to render_template :show
    end
  end
    
  #describe "GET edit_profile" do
    #before { get :edit_profile, id: user }
    
    #it "assigns the current_user to @user" do
      #expect(assigns(:user)).to eq user 
    #end 

    #it "renders the :edit_profile template" do
      #expect(response).to render_template :edit_profile
    #end
  #end

  #describe "GET edit_password" do
    #before { get :edit_password, id: user }
    
    #it "assigns the current_user to @user" do
      #expect(assigns(:user)).to eq user 
    #end 

    #it "renders the :edit_password template" do
      #expect(response).to render_template :edit_password
    #end
  #end

  describe "PATCH update_profile" do
    context 'with VALID profile attributes' do
      it "gets the current_user" do
        patch :update_profile, id: user, user: attributes_for(:user)
        expect(assigns(:user)).to eq user
      end

      it "changes @user's profile attributes " do
        patch :update_profile, id: user, user: attributes_for(:user, email: "new_email@gmail.com", first_name: "New", last_name: "Name", username: "new_user")
        user.reload
        expect(user.email).to eq "new_email@gmail.com"
        expect(user.first_name).to eq "New"
        expect(user.last_name).to eq "Name"
        expect(user.username).to eq "new_user"
      end

      it "redirects to the my_account path" do
        patch :update_profile, id: user, user: attributes_for(:user, email: "new_email@gmail.com", first_name: "New", last_name: "Name", username: "new_user")
        expect(response).to redirect_to action: :show 
      end
    end
 
    context "with INVALID profile attributes" do
      it "does not change @user's profile attributes" do
        @email = user.email
        @first_name = user.first_name
        @last_name = user.last_name
        @username = user.username
        patch :update_profile, id: user, user: attributes_for(:user, :invalid_profile)
        user.reload
        expect(user.email).to eq @email 
        expect(user.first_name).to eq @first_name 
        expect(user.last_name).to eq @last_name
        expect(user.username).to eq @username
      end

      it "re-renders the :show template" do
        patch :update_profile, id: user, user: attributes_for(:user, :invalid_profile)
        expect(response).to render_template :show
      end
    end
  end

  #Do password tesing in feature test(s)
  describe "PATCH update_password" do
    context 'with VALID password attributes' do
      it "gets the current_user-@user" do
        patch :update_password, id: user, user: attributes_for(:user)
        expect(assigns(:user)).to eq user
      end

      #it "changes @user's password attributes " do
        #patch :update_password, id: user, user: attributes_for(:user, password: "new_password", password_confirmation: "new_password")
        #user.reload
        #expect(user.password).to eq("new_password")
        #expect(user.password_confirmation).to eq("new_password")
      #end

      it "redirects to my_account path" do
        patch :update_password, id: user, user: attributes_for(:user, password: "new_password", password_confirmation: "new_password")
        expect(response).to redirect_to action: :show
      end
    end
 
    context "with INVALID password attributes" do
      #it "does not change @user's password attributes" do
        #patch :update_password, id: user, user: attributes_for(:user, :invalid_password)
        #expect(assigns(:user)).to eq nil 
      #end

      it "re-renders the :edit_password template" do
        patch :update_password, id: user, user: attributes_for(:user, :invalid_password)
        expect(response).to render_template :show
      end
    end
  end
end
