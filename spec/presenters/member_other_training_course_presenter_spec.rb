require "rails_helper"

RSpec.describe MemberOtherTrainingCoursePresenter, type: :presenter do
  let(:member_other_training_course){ create(:member_other_training_course) }
  subject(:presenter){ MemberOtherTrainingCoursePresenter.new(object: member_other_training_course, view_template: view) }

  it "returns the title" do
    expect(presenter.title).to eq(member_other_training_course.title)
  end

  it "returns the training provider name" do
    expect(presenter.training_provider_name).to eq(member_other_training_course.training_provider_name)
  end

  it "returns a localised version of completed on" do
    expect(presenter.completed_on).to eq(l(member_other_training_course.completed_on))
  end
end