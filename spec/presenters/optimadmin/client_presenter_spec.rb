require "rails_helper"

RSpec.describe Optimadmin::ClientPresenter, type: :presenter do
  let(:client) { build(:client_with_website) }
  subject(:client_presenter) { Optimadmin::ClientPresenter.new(object: client, view_template: view) }

  it "should return the clients name" do
    expect(client_presenter.name).to eq(client.name)
  end

  it "should return a link to the website for linked name" do
    puts client.website
    expect(client_presenter.website_link).to eq(link_to(client.website, client.website, target: "_blank"))
  end
end