require 'rails_helper'

RSpec.describe "hyvelet_missing_locations/show", :type => :view do
  before(:each) do
    @hyvelet_missing_location = assign(:hyvelet_missing_location, HyveletMissingLocation.create!(
      :deviceid => "Deviceid",
      :lat => 1.5,
      :lng => 1.5,
      :hyvelet_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Deviceid/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1/)
  end
end
