class ImmunisationHistoryPresenter < BasePresenter
  presents :immunisation_history

  def edit_link
    h.link_to "Edit Immunisation History", h.edit_member_area_immunisation_history_path
  end

  def triple_vaccination_date
    @triple_vaccination_date ||= if had_triple_vaccination
                                   h.l immunisation_history.triple_vaccination_date
                                 else
                                   "Not applicable"
                                 end
  end

  def polio_vaccination_date
    @polio_vaccination_date ||= if had_polio_vaccination
                                  h.l immunisation_history.polio_vaccination_date
                                else
                                  "Not applicable"
                                end
  end

  def hepatitis_b_vaccination_date
    @hepatitis_b_vaccination_date ||= if had_hepatitis_b_vaccination
                                        h.l immunisation_history.hepatitis_b_vaccination_date
                                      else
                                        "Not applicable"
                                      end
  end

  def had_hepatitis_b_vaccination
    @had_hepatitis_b_vaccination ||= immunisation_history.had_hepatitis_b_vaccination?
  end

  def hep_b_course_1_date
    @hep_b_course_1_date ||= if immunisation_history.hep_b_course_1_date.present?
                               h.l(immunisation_history.hep_b_course_1_date)
                             else
                               "Not applicable"
                             end
  end

  def hep_b_course_2_date
    @hep_b_course_2_date ||= if immunisation_history.hep_b_course_2_date.present?
                               h.l(immunisation_history.hep_b_course_2_date)
                             else
                               "Not applicable"
                             end
  end

  def hep_b_course_3_date
    @hep_b_course_3_date ||= if immunisation_history.hep_b_course_3_date.present?
                               h.l(immunisation_history.hep_b_course_3_date)
                             else
                               "Not applicable"
                             end
  end

  def hep_b_booster_1_date
    @hep_b_booster_1_date ||= if immunisation_history.hep_b_booster_1_date.present?
                               h.l(immunisation_history.hep_b_booster_1_date)
                             else
                               "Not applicable"
                             end
  end

  def hep_b_booster_2_date
    @hep_b_booster_2_date ||= if immunisation_history.hep_b_booster_2_date.present?
                               h.l(immunisation_history.hep_b_booster_2_date)
                             else
                               "Not applicable"
                             end
  end

  def hep_b_booster_3_date
    @hep_b_booster_3_date ||= if immunisation_history.hep_b_booster_3_date.present?
                                h.l(immunisation_history.hep_b_booster_3_date)
                              else
                                "Not applicable"
                              end
  end

  def role_involves_epps
    @role_involves_epps ||= if immunisation_history.role_involves_epps?
                              "The role involves Exposure Prone Procedures (EPPs)"
                            else
                              "The role doesn't involve Exposure Prone Procedures (EPPs)"
                            end
  end

  private

  def had_triple_vaccination
    @had_triple_vaccination ||= immunisation_history.had_triple_vaccination?
  end

  def had_polio_vaccination
    @had_polio_vaccination ||= immunisation_history.had_polio_vaccination?
  end
end