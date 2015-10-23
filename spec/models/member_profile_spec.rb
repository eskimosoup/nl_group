require 'rails_helper'

RSpec.describe MemberProfile, type: :model do
  describe "validations", :validation do
    it { should have_secure_password }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end
end
