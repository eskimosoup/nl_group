require "rails_helper"

RSpec.describe ResourcePresenter, type: :presenter do
  let(:resource){ create(:resource) }
  subject(:resource_presenter){ ResourcePresenter.new(object: resource, view_template: view) }

  it "should return the resources name" do
    expect(resource_presenter.name).to eq(resource.name)
  end

  it "should return a download link" do
    expect(resource_presenter.download_link).to eq(link_to("Download", resource.file.url, target: "_blank", class: "button download"))
  end

end