require 'rails_helper'

RSpec.describe JobApplication, type: :model do
  describe "associations", :association do
    it { should belong_to(:member_profile) }
    it { should belong_to(:job) }
  end
end
