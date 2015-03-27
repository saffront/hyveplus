require 'rails_helper'

RSpec.describe "hyves/show", :type => :view do
  before(:each) do
    @hyve = assign(:hyve, Hyve.create!(
      name: "MyHyve",
      uuid: "hyve-1",
      distance: "20",
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/hyve-1/)
    expect(rendered).to match(/20/)
   end
end
