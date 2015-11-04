require 'rails_helper'

RSpec.describe DbsCheck, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:member_profile) }

    describe "has previously completed dbs" do
      subject{ build(:dbs_check, enhanced_dbs_completed_before: true) }
      it { should validate_presence_of(:date_previous_dbs_completed) }
      it { should validate_presence_of(:company_completed_dbs_check) }
    end

    describe "has unprotected convictions" do
      subject{ build(:dbs_check, unprotected_convictions: true) }
      it { should validate_presence_of(:additional_information) }
    end

    describe "has unfiltered convictions" do
      subject{ build(:dbs_check, unfiltered_convictions: true) }
      it { should validate_presence_of(:additional_information) }
    end

    describe "has another_country_police_check" do
      subject{ build(:dbs_check, another_country_police_check: true) }
      it { should validate_presence_of(:additional_information) }
    end

    describe "is suspended_or_under_investigation" do
      subject{ build(:dbs_check, suspended_or_under_investigation: true) }
      it { should validate_presence_of(:additional_information) }
    end
  end

  describe "associations", :association do
    it { should belong_to(:member_profile) }
  end
end
