class MemberQualificationPresenter < BasePresenter
  presents :member_qualification

  def register
    professional_register || "Not a member of a professional register"
  end

  def registration_number
    return "Not applicable" if professional_register.blank?
    @registration_number ||= member_qualification.registration_number
  end

  def expiry_date
    return "Not applicable" if professional_register.blank?
    @expiry_date ||= h.l member_qualification.expiry_date
  end

  def afc_band
    case member_afc_band
      when 7
        "Band 7 or Higher"
      when 2..6
        "Band #{ member_afc_band }"
      else
        "Not applicable"
    end
  end

  def additional_qualifications
    @additional_qualifications ||= member_qualification.additional_qualifications
  end

  private

  def professional_register
    @professional_register ||= member_qualification.register
  end

  def member_afc_band
    @member_afc_band ||= member_qualification.afc_band
  end

end