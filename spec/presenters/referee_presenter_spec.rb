require "rails_helper"

RSpec.describe RefereePresenter, type: :presenter do
  let(:referee) { build(:referee) }
  subject(:referee_presenter) { RefereePresenter.new(object: referee, view_template: view) }

  it "should return the name" do
    expect(referee_presenter.name).to eq(referee.name)
  end

  it "should return the position" do
    expect(referee_presenter.position).to eq(referee.position)
  end

  it "should return the position" do
    expect(referee_presenter.contact_number).to eq(referee.contact_number)
  end

  it "should return the contact_number" do
    expect(referee_presenter.contact_number).to eq(referee.contact_number)
  end

  it "should return the fax_number" do
    expect(referee_presenter.fax_number).to eq(referee.fax_number)
  end

  it "should return the email_address" do
    expect(referee_presenter.email_address).to eq(referee.email_address)
  end

  it "should return the postal_address" do
    expect(referee_presenter.postal_address).to eq(referee.postal_address)
  end

  it "should return the contact_referee" do
    expect(referee_presenter.contact_referee?).to eq(referee.contact_referee?)
  end

end