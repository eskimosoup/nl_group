require 'rails_helper'

RSpec.describe MemberOtherTrainingCourse, type: :model do

  describe "validations", :validation do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:training_provider_name) }
    it { should validate_presence_of(:completed_on) }
  end

  describe "associations", :association do
    it { should belong_to(:member_training) }
  end
end
