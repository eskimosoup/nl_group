class PaymentInformation < ActiveRecord::Base

  PAYMENT_METHODS = ["Paye (Payroll)", "Umbrella Company", "Limited Company", "Sole Trader"]
  belongs_to :member_profile

  validates :payment_methodology, presence: true, inclusion: { in: PAYMENT_METHODS }
  validates :limit_working_week, inclusion: { in: [true, false] }

end
