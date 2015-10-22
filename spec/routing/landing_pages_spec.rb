require 'rails_helper'

RSpec.describe "routing to landing pages", type: :routing do

  describe "landing_page exists" do
    let!(:landing_page){ create(:landing_page) }

    it "routes to a landing page" do
      expect(get: landing_page_path(landing_page)).to route_to(controller: "landing_pages", action: "show", id: landing_page.slug)
    end
  end

  it "does not route to anything else" do
    expect(get: "/blah").not_to be_routable
  end

end