require 'rails_helper'

RSpec.describe MemberQualification, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:member_profile) }
    it { should validate_numericality_of(:afc_band).only_integer.allow_nil }
    it { should validate_inclusion_of(:afc_band).in_array((2..7).to_a)}
    describe "member of professional register" do
      subject(:member_qualification){ build(:member_qualification, register: "Some register") }
      it { should validate_presence_of(:registration_number) }
      it { should validate_presence_of(:expiry_date) }
    end
  end

  describe "associations", :association do
    it { should belong_to(:member_profile) }
  end
end
