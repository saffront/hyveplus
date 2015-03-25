require 'rails_helper'

RSpec.describe "hyve_missing_locations/show", :type => :view do
  before(:each) do
    @hyve_missing_location = assign(:hyve_missing_location, HyveMissingLocation.create!(
      :deviceid => "Deviceid",
      :lat => 1.5,
      :lng => 1.5,
      :hyve_id => 1
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
