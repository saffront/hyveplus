require 'rails_helper'

RSpec.describe "master_pins/show", :type => :view do
  before(:each) do
    @master_pin = assign(:master_pin, MasterPin.create!(
      :manufacturer => "Manufacturer",
      :serialnumber => "Serialnumber",
      :pin => "Pin"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Manufacturer/)
    expect(rendered).to match(/Serialnumber/)
    expect(rendered).to match(/Pin/)
  end
end
