require 'rails_helper'

RSpec.describe "MasterPins", :type => :request do
  describe "GET /master_pins" do
    it "works! (now write some real specs)" do
      get master_pins_path
      expect(response.status).to be(200)
    end
  end
end
