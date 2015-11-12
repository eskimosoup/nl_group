class MemberOtherTrainingCoursePresenter < BasePresenter
  presents :member_other_training_course

  def title
    @title ||= member_other_training_course.title
  end

  def training_provider_name
    @training_provider_name ||= member_other_training_course.training_provider_name
  end

  def completed_on
    @completed_on ||= h.l member_other_training_course.completed_on
  end
end