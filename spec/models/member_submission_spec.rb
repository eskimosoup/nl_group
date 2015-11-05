require 'rails_helper'

RSpec.describe MemberSubmission, type: :model do
  describe "validations", :validation do
    it { should validate_acceptance_of(:downloaded_handbook) }
    it { should validate_acceptance_of(:health_information_accurate) }
    it { should validate_acceptance_of(:full_acknowledgement) }
  end

  describe "associations", :association do
    it { should belong_to(:member_profile) }
  end
end
