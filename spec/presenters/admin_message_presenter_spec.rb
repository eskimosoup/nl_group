require "rails_helper"

RSpec.describe AdminMessagePresenter, type: :presenter do
  let(:admin_message) { build(:admin_message) }
  subject { AdminMessagePresenter.new(object: admin_message, view_template: view) }

  it "#title" do
    expect(subject.title).to eq(admin_message.title)
  end

  it "#content" do
    expect(subject.content).to eq(raw(admin_message.content))
  end
end