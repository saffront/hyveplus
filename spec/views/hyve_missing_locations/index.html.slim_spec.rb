require 'rails_helper'

RSpec.describe "hyve_missing_locations/index", :type => :view do
  before(:each) do
    assign(:hyve_missing_locations, [
      HyveMissingLocation.create!(
        :deviceid => "Deviceid",
        :lat => 1.5,
        :lng => 1.5,
        :hyve_id => 1
      ),
      HyveMissingLocation.create!(
        :deviceid => "Deviceid",
        :lat => 1.5,
        :lng => 1.5,
        :hyve_id => 1
      )
    ])
  end

  xit "renders a list of hyve_missing_locations" do
    render
    assert_select "tr>td", :text => "Deviceid".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
