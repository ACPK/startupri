require 'rails_helper'

RSpec.describe "startups/edit", :type => :view do
  before(:each) do
    @startup = assign(:startup, Startup.create!(
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

  it "renders the edit startup form" do
    render

    assert_select "form[action=?][method=?]", startup_path(@startup), "post" do

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
