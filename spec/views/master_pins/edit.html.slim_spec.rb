require 'rails_helper'

RSpec.describe "master_pins/edit", :type => :view do
  before(:each) do
    @master_pin = assign(:master_pin, MasterPin.create!(
      :manufacturer => "MyString",
      :serialnumber => "MyString",
      :pin => "MyString"
    ))
  end

  it "renders the edit master_pin form" do
    render

    assert_select "form[action=?][method=?]", master_pin_path(@master_pin), "post" do

      assert_select "input#master_pin_manufacturer[name=?]", "master_pin[manufacturer]"

      assert_select "input#master_pin_serialnumber[name=?]", "master_pin[serialnumber]"

      assert_select "input#master_pin_pin[name=?]", "master_pin[pin]"
    end
  end
end
