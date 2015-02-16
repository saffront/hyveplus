require 'rails_helper'

RSpec.describe "master_pins/new", :type => :view do
  before(:each) do
    assign(:master_pin, MasterPin.new(
      :manufacturer => "MyString",
      :serialnumber => "MyString",
      :pin => "MyString"
    ))
  end

  it "renders new master_pin form" do
    render

    assert_select "form[action=?][method=?]", master_pins_path, "post" do

      assert_select "input#master_pin_manufacturer[name=?]", "master_pin[manufacturer]"

      assert_select "input#master_pin_serialnumber[name=?]", "master_pin[serialnumber]"

      assert_select "input#master_pin_pin[name=?]", "master_pin[pin]"
    end
  end
end
