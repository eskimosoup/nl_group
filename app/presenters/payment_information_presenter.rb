class PaymentInformationPresenter < BasePresenter
  presents :payment_information

  def payment_methodology
    @payment_methodology ||= payment_information.payment_methodology
  end

  def limit_working_week
    if will_limit_working_week?
      "I agree to limit my working week to no more than 48 hours"
    else
      "I disagree to limit my working week to no more than 48 hours (If I choose to, I may work more hours)"
    end
  end

  private

  def will_limit_working_week?
    @will_limit_working_week ||= payment_information.limit_working_week?
  end
end