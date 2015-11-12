require "rails_helper"

RSpec.describe MemberQualificationPresenter, type: :presenter do
  let!(:member_qualification){ create(:member_qualification) }
  subject!(:member_qualification_presenter){ MemberQualificationPresenter.new(object: member_qualification, view_template: view) }

  describe "register member of" do
    it "should return no register if appropriate" do
      member_qualification.register = nil
      expect(subject.register).to eq("Not a member of a professional register")
    end

    it "should return their register" do
      expect(subject.register).to eq(member_qualification.register)
    end
  end

  describe "registration number" do
    it "should return the registration number" do
      member_qualification.register = nil
      expect(subject.registration_number).to eq("Not applicable")
    end

    it "should return the registration number" do
      expect(subject.registration_number).to eq(member_qualification.registration_number)
    end
  end

  describe "expiry date" do
    it "should return the not applicable if not a member of a register" do
      member_qualification.register = nil
      expect(subject.expiry_date).to eq("Not applicable")
    end

    it "should be localised" do
      expect(subject.expiry_date).to eq(l(member_qualification.expiry_date))
    end
  end

  describe "afc_band" do
    it "with no afc band" do
      member_qualification.afc_band = nil
      expect(subject.afc_band).to eq("Not applicable")
    end

    it "has a band of 7" do
      member_qualification.afc_band = 7
      expect(subject.afc_band).to eq("Band 7 or Higher")
    end

    it "has a band between 2 and 6" do
      member_qualification.afc_band = Random.new.rand(2..6)
      expect(subject.afc_band).to eq("Band #{ member_qualification.afc_band }")
    end
  end

  it "returns additional qualifications" do
    expect(subject.additional_qualifications).to eq(member_qualification.additional_qualifications)
  end
end
