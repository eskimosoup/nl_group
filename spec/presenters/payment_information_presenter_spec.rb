require "rails_helper"

RSpec.describe PaymentInformationPresenter, type: :presenter do
  let(:payment_information){ build(:payment_information) }
  subject{ PaymentInformationPresenter.new(object: payment_information, view_template: view) }

  it "#payment_methodology" do
    expect(subject.payment_methodology).to eq(payment_information.payment_methodology)
  end

  describe "#limit_working_week" do
    it "is true" do
      payment_information.limit_working_week = true
      expect(subject.limit_working_week).to eq("I agree to limit my working week to no more than 48 hours")
    end

    it "is false" do
      payment_information.limit_working_week = false
      expect(subject.limit_working_week).to eq("I disagree to limit my working week to no more than 48 hours (If I choose to, I may work more hours)")
    end
  end
end
