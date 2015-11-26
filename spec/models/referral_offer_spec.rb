require 'rails_helper'

RSpec.describe ReferralOffer, type: :model do

  describe "validations", :validation do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:details) }
    it { should validate_presence_of(:terms_and_conditions) }
  end

  describe "associations", :association do
    it { should have_many(:referrals) }
  end

end
