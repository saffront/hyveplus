require 'rails_helper'

RSpec.describe My::HyvesController, type: :controller do

  let!(:user) { create :user } 
  let!(:hyve) { create :hyve } 

  before do
    login_user(user)
  end

  it { should permit(:name, :distance, :image).for(:update, verb: :patch, params: { id: hyve.uuid } ) }

  describe "PATCH update" do
    context 'with VALID hyve attributes' do
      it "gets @hyve" do
        p hyve.inspect
        patch :update, id: hyve.uuid, hyve: attributes_for(:hyve)
        expect(assigns(:hyve)).to eq hyve
      end

      it "changes @hyve's attributes " do
        patch :update, id: hyve.uuid, hyve: attributes_for(:hyve, name: "new_name", distance: "4")
        hyve.reload
        expect(hyve.name).to eq("new_name")
        expect(hyve.distance).to eq("4")
      end

      it "redirects to my_account path" do
        patch :update, id: hyve.uuid, hyve: attributes_for(:hyve, name: "new_name", distance: "4")
        expect(response).to redirect_to my_account_path
      end
    end
 
    context "with INVALID password attributes" do
      it "does not change @hyve's attributes " do
        @initial_name = hyve.name
        patch :update, id: hyve.uuid, hyve: attributes_for(:hyve, name: "", uuid: "!$%^&", distance: "7")
        hyve.reload
        expect(hyve.name).to eq(@initial_name)
        expect(hyve.distance).to eq("2")
      end

      it "redirects to my_account path" do
        patch :update, id: hyve.uuid, hyve: attributes_for(:hyve, name: "new_name", uuid: "hyve-1010", distance: "4")
        expect(response).to redirect_to my_account_path
      end
    end
  end
end
