require 'rails_helper'

RSpec.describe "hyve_missing_locations/edit", :type => :view do
  before(:each) do
    @hyve_missing_location = assign(:hyve_missing_location, HyveMissingLocation.create!(
      :deviceid => "MyString",
      :lat => 1.5,
      :lng => 1.5,
      :hyve_id => 1
    ))
  end

  it "renders the edit hyve_missing_location form" do
    render

    assert_select "form[action=?][method=?]", hyve_missing_location_path(@hyve_missing_location), "post" do

      assert_select "input#hyve_missing_location_deviceid[name=?]", "hyve_missing_location[deviceid]"

      assert_select "input#hyve_missing_location_lat[name=?]", "hyve_missing_location[lat]"

      assert_select "input#hyve_missing_location_lng[name=?]", "hyve_missing_location[lng]"

      assert_select "input#hyve_missing_location_hyve_id[name=?]", "hyve_missing_location[hyve_id]"
    end
  end
end
