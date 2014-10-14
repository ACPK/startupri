require 'rails_helper'

RSpec.describe "Startups", :type => :request do
  describe "GET /startups" do
    it "works! (now write some real specs)" do
      get startups_path
      expect(response).to have_http_status(200)
    end
  end
end
