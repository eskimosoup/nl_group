require 'rails_helper'

RSpec.describe PaymentInformation, type: :model do

  describe "validations", :validation do
    it { should validate_presence_of(:payment_methodology) }
    it { should validate_inclusion_of(:payment_methodology).in_array(PaymentInformation::PAYMENT_METHODS) }
  end

  describe "associations", :association do
    it { should belong_to(:member_profile) }
  end
end
