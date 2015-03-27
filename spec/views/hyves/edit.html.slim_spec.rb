require 'rails_helper'

RSpec.describe "hyves/edit", :type => :view do
  before(:each) do
    @hyve = assign(:hyve, Hyve.create!(
      name: "MyHyve",
      uuid: "hyve-1",
      distance: "20",
    ))
  end

  it "renders the edit hyve form" do
    render
    assert_select "form[action=?][method=?]", hyve_path(@hyve), "post" do
      assert_select "input#hyve_name[name=?]", "hyve[name]"
      assert_select "input#hyve_uuid[name=?]", "hyve[uuid]"
      assert_select "input#hyve_distance[name=?]", "hyve[distance]"
      #assert_select "input#hyve_pin[name=?]", "hyve[pin]"
      #assert_select "input#hyve_lat[name=?]", "hyve[lat]"
      #assert_select "input#hyve_lng[name=?]", "hyve[lng]"
     end
   end
end
