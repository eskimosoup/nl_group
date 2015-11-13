class TuberculosisChickenPoxCheckPresenter < BasePresenter
  presents :tuberculosis_chicken_pox_check

  def lived_continuously
    @lived_continuously ||= "#{ has_lived_continuously? ? "Have" : "Have not" } lived continuously in the UK for the last 5 years"
  end

  def bcg_vaccination
    @bcg_vaccination ||= "#{ has_had_vaccination? ? "Have" : "Have not" } had a BCG vaccination"
  end

  def vaccination_date
    @vaccination_date ||= if has_had_vaccination?
      h.l tuberculosis_chicken_pox_check.vaccination_date
    else
      "Not applicable"
    end
  end

  def edit_link
    h.link_to "Tuberculosis and Chicken Pox Information", h.edit_member_area_tuberculosis_chicken_pox_check_path
  end

  def cough
    @cough ||= begin
      if tuberculosis_chicken_pox_check.cough?
        "Yes"
      else
        "No"
      end
    end
  end

  def weight_loss
    @weight_loss ||= begin
      if tuberculosis_chicken_pox_check.weight_loss?
        "Yes"
      else
        "No"
      end
    end
  end

  def fever
    @fever ||= begin
      if tuberculosis_chicken_pox_check.fever?
        "Yes"
      else
        "No"
      end
    end
  end

  def had_tb
    @had_tb ||= begin
      if tuberculosis_chicken_pox_check.had_tb?
        "Yes"
      else
        "No"
      end
    end
  end

  def has_lived_continuously?
    @has_lived_continuously ||= tuberculosis_chicken_pox_check.lived_continuously?
  end

  def has_additional_information?
    @has_addiational_information ||= tuberculosis_chicken_pox_check.needs_additional_information?
  end

  def additional_information
    @additional_information ||= tuberculosis_chicken_pox_check.additional_information
  end

  def had_chicken_pox
    if had_chicken_pox?
      "Yes - #{ h.l chicken_pox_date }"
    else
      "No"
    end
  end

  def had_chicken_pox?
    @had_chicken_pox ||= tuberculosis_chicken_pox_check.had_chicken_pox
  end

  private

  def has_had_vaccination?
    @has_had_vaccination ||= tuberculosis_chicken_pox_check.bcg_vaccination?
  end

  def chicken_pox_date
    @chicken_pox_date ||= tuberculosis_chicken_pox_check.chicken_pox_date
  end
end
