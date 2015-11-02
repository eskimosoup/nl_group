require "rails_helper"

RSpec.describe EmergencyContactPresenter, type: :presenter do
  let(:emergency_contact) { create(:emergency_contact) }
  subject(:emergency_contact_presenter) { EmergencyContactPresenter.new(object: emergency_contact, view_template: view) }

  it "should return the full name" do
    expect(emergency_contact_presenter.full_name).to eq(emergency_contact.full_name)
  end

  it "should return the email address" do
    expect(emergency_contact_presenter.email_address).to eq(emergency_contact.email_address)
  end

  it "should return the mobile number"  do
    expect(emergency_contact_presenter.mobile_number).to eq(emergency_contact.mobile_number)
  end

  it "should return the relationship" do
    expect(emergency_contact_presenter.relationship).to eq(emergency_contact.relationship)
  end

  it "should return an edit link" do
    expect(emergency_contact_presenter.edit_link).to eq(link_to "Edit emergency contact", edit_member_area_emergency_contact_path)
  end
end