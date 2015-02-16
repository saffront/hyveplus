require 'rails_helper'

RSpec.describe "hyvelet_missing_locations/edit", :type => :view do
  before(:each) do
    @hyvelet_missing_location = assign(:hyvelet_missing_location, HyveletMissingLocation.create!(
      :deviceid => "MyString",
      :lat => 1.5,
      :lng => 1.5,
      :hyvelet_id => 1
    ))
  end

  it "renders the edit hyvelet_missing_location form" do
    render

    assert_select "form[action=?][method=?]", hyvelet_missing_location_path(@hyvelet_missing_location), "post" do

      assert_select "input#hyvelet_missing_location_deviceid[name=?]", "hyvelet_missing_location[deviceid]"

      assert_select "input#hyvelet_missing_location_lat[name=?]", "hyvelet_missing_location[lat]"

      assert_select "input#hyvelet_missing_location_lng[name=?]", "hyvelet_missing_location[lng]"

      assert_select "input#hyvelet_missing_location_hyvelet_id[name=?]", "hyvelet_missing_location[hyvelet_id]"
    end
  end
end
