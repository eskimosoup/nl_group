class QualificationPresenter < BasePresenter
  presents :qualification

  def name
    @name ||= qualification.name
  end

  def grade_obtained
    @grade_obtained ||= qualification.grade_obtained
  end

  def completed_date
    @completed_date ||= h.l(qualification.completed_date)
  end

end