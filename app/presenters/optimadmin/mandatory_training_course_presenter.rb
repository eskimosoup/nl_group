module Optimadmin
  class MandatoryTrainingCoursePresenter < Optimadmin::BasePresenter
    presents :mandatory_training_course
    delegate :id, to: :mandatory_training_course

    def name
      mandatory_training_course.name
    end
  end
end
