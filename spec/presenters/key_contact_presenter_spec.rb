require "rails_helper"

RSpec.describe KeyContactPresenter, type: :presenter do
  let(:key_contact) { build(:key_contact) }
  subject { KeyContactPresenter.new(object: key_contact, view_template: view) }

  it "#name" do
    expect(subject.name).to eq(key_contact.name)
  end

  it "#phone_number" do
    expect(subject.phone_number).to eq(key_contact.phone_number)
  end

  it "#mobile_number" do
    expect(subject.mobile_number).to eq(key_contact.mobile_number)
  end

  describe "#email" do
    it "exists" do
      expect(subject.email).to eq(mail_to key_contact.email)
    end

    it "does not exist" do
      key_contact.email = nil
      expect(subject.email).to be nil
    end
  end
end