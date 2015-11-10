class WorkEligibilityPresenter < BasePresenter
  presents :work_eligibility

  def passport_number
    @passport_number ||= work_eligibility.passport_number
  end

  def expiry_date
    @expiry_date ||= h.l work_eligibility.expiry_date
  end

  def nationality
    return @nationality if defined? @nationality
    @nationality = work_eligibility.nationality
  end

  def hold_eu_passport
    @hold_eu_passport ||= begin
      if holds_eu_passport?
        "Yes"
      else
        "No"
      end
    end
  end

  def proof_of_right_to_work
    @proof_of_right_to_work ||= begin
      if holds_eu_passport?
        "Not applicable"
      else
        work_eligibility.proof_of_right_to_work
      end
    end
  end

  private

  def holds_eu_passport?
    @holds_an_eu_passport ||= work_eligibility.hold_eu_passport?
  end
end