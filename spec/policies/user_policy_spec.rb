require 'rails_helper'

describe UserPolicy, type: :policy do
  subject { UserPolicy.new(user, user) }

  context "for a visitor" do
    let!(:user) { create(:user) }

    it { should_not authorise(:index) }
    it { should_not authorise(:show) }
    it { should_not authorise(:edit) }
    it { should_not authorise(:update) }
    it { should_not authorise(:destroy) }
  end

  context "for a user" do
    let!(:user) { create(:user, :admin) }

    it { should authorise(:index) }
    it { should authorise(:show) }
    it { should authorise(:edit) }
    it { should authorise(:update) }
    it { should authorise(:destroy) }
  end
end
