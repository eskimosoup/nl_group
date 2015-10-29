require "rails_helper"

RSpec.describe Optimadmin::MandatoryTrainingCoursePresenter, type: :presenter do
  let(:mandatory_training_course) { build(:mandatory_training_course) }
  subject(:mandatory_training_course_presenter) { Optimadmin::MandatoryTrainingCoursePresenter.new(object: mandatory_training_course, view_template: view) }

  it "should return the id" do
    expect(mandatory_training_course_presenter.id).to eq(mandatory_training_course.id)
  end

  it "should return the title" do
    expect(mandatory_training_course_presenter.name).to eq(mandatory_training_course.name)
  end

end