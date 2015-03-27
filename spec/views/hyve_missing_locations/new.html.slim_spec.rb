require 'rails_helper'

RSpec.describe "hyve_missing_locations/new", :type => :view do
  before(:each) do
    assign(:hyve_missing_location, HyveMissingLocation.new(
      :deviceid => "MyString",
      :lat => 1.5,
      :lng => 1.5,
      :hyve_id => 1
    ))
  end

  xit "renders new hyve_missing_location form" do
    render

    assert_select "form[action=?][method=?]", hyve_missing_locations_path, "post" do

      assert_select "input#hyve_missing_location_deviceid[name=?]", "hyve_missing_location[deviceid]"

      assert_select "input#hyve_missing_location_lat[name=?]", "hyve_missing_location[lat]"

      assert_select "input#hyve_missing_location_lng[name=?]", "hyve_missing_location[lng]"

      assert_select "input#hyve_missing_location_hyve_id[name=?]", "hyve_missing_location[hyve_id]"
    end
  end
end
