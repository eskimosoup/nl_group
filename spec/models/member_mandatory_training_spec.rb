require 'rails_helper'

RSpec.describe MemberMandatoryTraining, type: :model do
  describe "associations", :association do
    it { should belong_to(:member_training) }
    it { should belong_to(:mandatory_training_course) }
  end
end
