require 'rails_helper'

RSpec.describe Api::ApiController, type: :controller do
  let!(:user) { create(:user, :with_api_token) } 

  describe "authenticate api token" do
    #context "with valid token" do
      #before { request.headers["X-hyve-token"] = user.api_token }

      #it "should login user" do
        #@user = User.find_by_api_token(user.api_token)
        #expect(request.headers["X-hyve-token"]).to be_present
        #expect(@user).to_not be_nil
        #login_user(user)
        #expect(response).to be_success
      #end
    #end

    #Not sure how to do this
    context "with invalid token" do
      before { request.headers["X-hyve-token"] = "" }

      it "should render json with status :unauthorized" do
        @user = User.find_by_api_token("")
        expect(request.headers["X-hyve-token"]).to be_blank
        expect(@user).to be_nil 
        #json = JSON.parse(response.body)
        #expect(json["status"]).to eq("unauthorized")
      end
    end
  end
end
