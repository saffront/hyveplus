require 'rails_helper'

RSpec.describe "hyvelet_missing_locations/index", :type => :view do
  before(:each) do
    assign(:hyvelet_missing_locations, [
      HyveletMissingLocation.create!(
        :deviceid => "Deviceid",
        :lat => 1.5,
        :lng => 1.5,
        :hyvelet_id => 1
      ),
      HyveletMissingLocation.create!(
        :deviceid => "Deviceid",
        :lat => 1.5,
        :lng => 1.5,
        :hyvelet_id => 1
      )
    ])
  end

  it "renders a list of hyvelet_missing_locations" do
    render
    assert_select "tr>td", :text => "Deviceid".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
