require "rails_helper"

RSpec.describe Optimadmin::AdminMessagePresenter, type: :presenter do
  let(:admin_message) { build(:admin_message) }
  subject{ Optimadmin::AdminMessagePresenter.new(object: admin_message, view_template: view)}

  it "#title" do
    expect(subject.title).to eq(admin_message.title)
  end
end