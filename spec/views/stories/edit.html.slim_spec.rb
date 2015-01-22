require 'rails_helper'

RSpec.describe "stories/edit", :type => :view do
  before(:each) do
    @story = assign(:story, Story.create!(
      :title => "MyString",
      :content => "MyText",
      :author => "MyString"
    ))
  end

  it "renders the edit story form" do
    render

    assert_select "form[action=?][method=?]", story_path(@story), "post" do

      assert_select "input#story_title[name=?]", "story[title]"

      assert_select "textarea#story_content[name=?]", "story[content]"

      assert_select "input#story_author[name=?]", "story[author]"
    end
  end
end
