require 'rails_helper'

RSpec.describe "startups/new", :type => :view do
  before(:each) do
    assign(:startup, Startup.new(
      :name => "MyString",
      :description => "MyText",
      :logo => "",
      :url => "MyString",
      :youtube => "MyString",
      :facebook => "MyString",
      :twitter => "MyString",
      :crunchbase => "MyString",
      :user_id => 1
    ))
  end

  it "renders new startup form" do
    render

    assert_select "form[action=?][method=?]", startups_path, "post" do

      assert_select "input#startup_name[name=?]", "startup[name]"

      assert_select "textarea#startup_description[name=?]", "startup[description]"

      assert_select "input#startup_logo[name=?]", "startup[logo]"

      assert_select "input#startup_url[name=?]", "startup[url]"

      assert_select "input#startup_youtube[name=?]", "startup[youtube]"

      assert_select "input#startup_facebook[name=?]", "startup[facebook]"

      assert_select "input#startup_twitter[name=?]", "startup[twitter]"

      assert_select "input#startup_crunchbase[name=?]", "startup[crunchbase]"

      assert_select "input#startup_user_id[name=?]", "startup[user_id]"
    end
  end
end
