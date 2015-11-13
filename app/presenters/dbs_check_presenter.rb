class DbsCheckPresenter < BasePresenter
  presents :dbs_check

  def prior_dbs_check?
    @prior_dbs_check ||= dbs_check.enhanced_dbs_completed_before?
  end

  def enhanced_dbs_completed_before
    if prior_dbs_check?
      "Yes"
    else
      "No"
    end
  end

  def previous_disclosure_number
    if prior_dbs_check?
      dbs_check.previous_disclosure_number
    else
      "Not applicable"
    end
  end

  def date_previous_dbs_completed
    if prior_dbs_check?
      h.l(dbs_check.date_previous_dbs_completed)
    else
      "Not applicable"
    end
  end

  def company_completed_dbs_check
    if prior_dbs_check?
      dbs_check.company_completed_dbs_check
    else
      "Not applicable"
    end
  end

  def unprotected_convictions
    if dbs_check.unprotected_convictions
      "Yes"
    else
      "No"
    end
  end

  def unfiltered_convictions
    if dbs_check.unfiltered_convictions
      "Yes"
    else
      "No"
    end
  end

  def another_country_police_check
    if dbs_check.another_country_police_check
      "Yes"
    else
      "No"
    end
  end

  def suspended_or_under_investigation
    if dbs_check.suspended_or_under_investigation
      "Yes"
    else
      "No"
    end
  end

  def additional_information
    dbs_check.additional_information
  end
end