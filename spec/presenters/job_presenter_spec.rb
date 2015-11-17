require "rails_helper"

RSpec.describe JobPresenter, type: :presenter do
  let(:job) { build(:job) }
  subject{ JobPresenter.new(object: job, view_template: view) }

  it "#full_title" do
    expect(subject.full_title).to eq(job.full_title)
  end

  it "#department" do
    expect(subject.department).to eq(job.department)
  end

  it "#url" do
    expect(subject.url).to eq(link_to "View Job", job.url)
  end

  it "#application_url" do
    expect(subject.application_url).to eq(link_to "Apply Here", job.application_url)
  end
end
