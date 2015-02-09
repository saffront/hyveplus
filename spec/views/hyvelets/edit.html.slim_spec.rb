require 'rails_helper'

RSpec.describe "hyvelets/edit", :type => :view do
  before(:each) do
    @hyvelet = assign(:hyvelet, Hyvelet.create!(
      :user => 1,
      :name => "MyString",
      :pin => "MyString",
      :lat => "",
      :lng => ""
    ))
  end

  it "renders the edit hyvelet form" do
    render

    assert_select "form[action=?][method=?]", hyvelet_path(@hyvelet), "post" do

      assert_select "input#hyvelet_user[name=?]", "hyvelet[user]"

      assert_select "input#hyvelet_name[name=?]", "hyvelet[name]"

      assert_select "input#hyvelet_pin[name=?]", "hyvelet[pin]"

      assert_select "input#hyvelet_lat[name=?]", "hyvelet[lat]"

      assert_select "input#hyvelet_lng[name=?]", "hyvelet[lng]"
    end
  end
end
