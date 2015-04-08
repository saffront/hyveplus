require 'rails_helper'

RSpec.describe My::HyvesController, type: :controller do

  let!(:user) { create(:user) }
  let!(:hyve) { create(:hyve, user: user) }

  before do
    login_user(user)
  end

  it { should permit(:name, :uuid, :distance, :image).for(:update, params: { id: hyve.uuid } ) }

  describe "GET show" do
    before { get :show, id: hyve.uuid }

    it "assigns the hyve to @hyve" do
      expect(assigns(:hyve)).to eq hyve 
    end

    it "renders the :show template" do
      expect(response).to render_template :show
    end
  end

  describe "GET edit" do
    before { get :edit, id: hyve.uuid }

    it "renders the :edit template" do
      expect(response).to render_template :edit
    end
  end

  describe "PATCH update" do
    context "with VALID hyve attributes" do
      xit "gets the hyve" do
      end 

      xit "changes @hyve's attributes" do
      end

      xit "redirect to hyve_path" do
      end
    end

    context "with INVALID hyve attributes" do
      xit "does not change @hyve's attributes" do
      end

      xit "re-renders :edit template" do
      end
    end
  end

  describe "DELETE destroy" do
      xit "deletes the user's hyve" do
      end

      xit "redirects to my_account_path" do
      end
  end
end
