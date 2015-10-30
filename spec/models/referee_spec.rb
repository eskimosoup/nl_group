require 'rails_helper'

RSpec.describe Referee, type: :model do

  describe "validations", :validation do
    it { should validate_presence_of(:member_profile) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:position) }
    it { should validate_presence_of(:contact_number) }
    it { should validate_presence_of(:email_address) }
    it { should validate_presence_of(:postal_address) }
  end

  describe "associations", :association do
    it { should belong_to(:member_profile) }
  end
end
