require 'rails_helper'

RSpec.describe MemberTraining, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:member_profile) }
  end

  describe "associations", :association do
    it { should belong_to(:member_profile) }
    it { should have_many(:member_mandatory_trainings) }
    it { should have_many(:mandatory_training_courses).through(:member_mandatory_trainings) }
  end
end
