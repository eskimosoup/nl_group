require "rails_helper"

RSpec.describe ClientPresenter, type: :presenter do
  let(:client) { build(:client) }
  subject(:client_presenter) { ClientPresenter.new(object: client, view_template: view) }

  it "should return the clients name" do
    expect(client_presenter.name).to eq(client.name)
  end

  it "should return the client logo" do
    expect(client_presenter.logo).to eq(image_tag(client.logo.show, alt: client.name, title: client.name))
  end

  it "should return nil for linked name" do
    expect(client_presenter.linked_name).to eq(nil)
  end

  it "should return nil for linked logo" do
    expect(client_presenter.linked_logo).to eq(nil)
  end

  describe "client with website" do
    let(:client) { build(:client_with_website) }
    subject(:client_presenter) { ClientPresenter.new(object: client, view_template: view) }

    it "should return a link to the website for linked name" do
      expect(client_presenter.linked_name).to eq(link_to(client.name, client.website, target: "_blank"))
    end

    it "should return nil for linked logo" do
      linked_logo = link_to(image_tag(client.logo.show, alt: client.name, title: client.name), client.website, target: "_blank")
      expect(client_presenter.linked_logo).to eq(linked_logo)
    end
  end
end