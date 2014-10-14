require 'rails_helper'

RSpec.describe "startups/index", :type => :view do
  before(:each) do
    assign(:startups, [
      Startup.create!(
        :name => "Name",
        :description => "MyText",
        :logo => "",
        :url => "Url",
        :youtube => "Youtube",
        :facebook => "Facebook",
        :twitter => "Twitter",
        :crunchbase => "Crunchbase",
        :user_id => 1
      ),
      Startup.create!(
        :name => "Name",
        :description => "MyText",
        :logo => "",
        :url => "Url",
        :youtube => "Youtube",
        :facebook => "Facebook",
        :twitter => "Twitter",
        :crunchbase => "Crunchbase",
        :user_id => 1
      )
    ])
  end

  it "renders a list of startups" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Youtube".to_s, :count => 2
    assert_select "tr>td", :text => "Facebook".to_s, :count => 2
    assert_select "tr>td", :text => "Twitter".to_s, :count => 2
    assert_select "tr>td", :text => "Crunchbase".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
