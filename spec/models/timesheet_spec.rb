require 'rails_helper'

RSpec.describe Timesheet, type: :model do

  describe "validations", :validation do
    it { should validate_presence_of(:member_profile) }
  end

  describe "associations", :association do
    it { should belong_to(:member_profile) }
  end

end
