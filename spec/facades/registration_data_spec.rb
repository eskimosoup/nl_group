require "rails_helper"

RSpec.describe RegistrationData, type: :facade do
  let(:member_profile){ create(:member_profile) }
  subject(:registration_data) { RegistrationData.new(member_profile) }
end
