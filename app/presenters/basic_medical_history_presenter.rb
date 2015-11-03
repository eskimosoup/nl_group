class BasicMedicalHistoryPresenter < BasePresenter
  presents :basic_medical_history

  def gp_address
    basic_medical_history.gp_address
  end

  def illness_affecting_work
    if illness_affecting_work?
      "I have an illness/impairment/disability (physical or psychological) which may affect my work"
    else
      "I do not have an illness/impairment/disability (physical or psychological) which may affect my work"
    end
  end

  def illness_caused_by_work
    if illness_caused_by_work?
      "I have had an illness/impairment/disability (physical or psychological) which may have been caused or made worse by your work"
    else
      "I have never had an illness/impairment/disability (physical or psychological) which may have been caused or made worse by your work"
    end
  end

  def require_assistance
    if require_assistance?
      "I think I may need some adjustments or assistance to help me to do the job"
    else
      "I do not think I need adjustments or assistance to help me to do the job"
    end
  end

  def having_treatment
    if having_treatment?
      "I am having or waiting for treatment (including medication) or investigations at present"
    else
      "I am not having or waiting for treatment (including medication) or investigations at present"
    end
  end

  def treatment_clarification
    basic_medical_history.treatment_clarification
  end

  def edit_link
    h.link_to "Edit Basic Medical History", h.edit_member_area_basic_medical_history_path
  end

  private

  def illness_affecting_work?
    basic_medical_history.illness_affecting_work?
  end

  def illness_caused_by_work?
    basic_medical_history.illness_caused_by_work?
  end

  def require_assistance?
    basic_medical_history.require_assistance?
  end

  def having_treatment?
    basic_medical_history.having_treatment?
  end
end