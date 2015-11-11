require "rails_helper"

RSpec.describe RegistrationData, type: :facade do
  let(:member_profile){ create(:member_profile) }
  subject(:registration_data) { RegistrationData.new(member_profile) }

  it "should return the basic information of the member profile" do
    basic_information = instance_double("BasicInformation")
    allow(member_profile).to receive(:basic_information).and_return(basic_information)
    expect(registration_data.basic_information).to eq(basic_information)
  end

  it "should return the work eligibility of the member profile" do
    work_eligibility = instance_double("WorkEligibility")
    allow(member_profile).to receive(:work_eligibility).and_return(work_eligibility)
    expect(registration_data.work_eligibility).to eq(work_eligibility)
  end

  it "should return the addresses of the member profile" do
    addresses = Array.new(3, instance_double("WorkEligibility"))
    allow(member_profile).to receive_message_chain(:member_addresses, :lived_here_from).and_return(addresses)
    expect(registration_data.addresses).to eq(addresses)
  end

end
