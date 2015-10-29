require 'rails_helper'

RSpec.describe Qualification, type: :model do

  describe "validations", :validation do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:grade_obtained) }
    it { should validate_presence_of(:completed_date) }
    describe "completed date in future" do
      subject(:qualification) { build(:qualification, completed_date: 3.weeks.from_now) }
      it "should be invalid" do
        qualification.valid?
        expect(qualification.errors[:completed_date]).to include("can't be in the future")
      end
    end
  end

  describe "associations", :association do
    it { should belong_to(:member_qualification) }
  end
end
