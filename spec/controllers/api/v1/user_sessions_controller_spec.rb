require 'rails_helper'

RSpec.describe Api::UserSessionsController, type: :controller do

  xit { should permit(:email, :password, :password_confirmation, :username, :avatar, :first_name, :last_name, :api_token, :uid, :provider).for(:create) }

  describe "POST create" do
    context "registering with email" do
      xit "should register user" do
      end
    end

    context "logging in with email" do
      xit "should login user" do
      end
    end

    context "registering with Facebook/Twitter" do
      xit "should register user" do
      end
    end

    context "logging in with Facebook/Twitter" do
      xit "should login user" do
      end
    end
  end
end
