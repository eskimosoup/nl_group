require "rails_helper"

RSpec.describe Optimadmin::ResourcePresenter, type: :presenter do
  let(:resource) { build(:resource) }
  subject(:resource_presenter){ Optimadmin::ResourcePresenter.new(object: resource, view_template: view) }

  it "should return the resources name" do
    expect(resource_presenter.name).to eq(resource.name)
  end

  it "should return a download link" do
    expect(resource_presenter.view_link).to eq(link_to(content_tag(:span, '', class: "octicon octicon-eye"), resource.file.url, target: "_blank"))
  end

end