require 'rails_helper'

RSpec.describe "master_pins/index", :type => :view do
  before(:each) do
    assign(:master_pins, [
      MasterPin.create!(
        :manufacturer => "Manufacturer",
        :serialnumber => "Serialnumber",
        :pin => "Pin"
      ),
      MasterPin.create!(
        :manufacturer => "Manufacturer",
        :serialnumber => "Serialnumber",
        :pin => "Pin"
      )
    ])
  end

  it "renders a list of master_pins" do
    render
    assert_select "tr>td", :text => "Manufacturer".to_s, :count => 2
    assert_select "tr>td", :text => "Serialnumber".to_s, :count => 2
    assert_select "tr>td", :text => "Pin".to_s, :count => 2
  end
end
