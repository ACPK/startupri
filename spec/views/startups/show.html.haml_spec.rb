require 'rails_helper'

RSpec.describe "startups/show", :type => :view do
  before(:each) do
    @startup = assign(:startup, Startup.create!(
      :name => "Name",
      :description => "MyText",
      :logo => "",
      :url => "Url",
      :youtube => "Youtube",
      :facebook => "Facebook",
      :twitter => "Twitter",
      :crunchbase => "Crunchbase",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/Youtube/)
    expect(rendered).to match(/Facebook/)
    expect(rendered).to match(/Twitter/)
    expect(rendered).to match(/Crunchbase/)
    expect(rendered).to match(/1/)
  end
end
