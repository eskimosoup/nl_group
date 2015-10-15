require "rails_helper"

RSpec.describe Optimadmin::TestimonialPresenter, type: :presenter do
  let(:testimonial){ build(:testimonial) }
  subject(:testimonial_presenter){ Optimadmin::TestimonialPresenter.new(object: testimonial, view_template: view)}

  it "should return the forename" do
    expect(testimonial_presenter.forename).to eq(testimonial.forename)
  end

  it "should return the surname" do
    expect(testimonial_presenter.surname).to eq(testimonial.surname)
  end

  it "should return the name by joining the forename and surname" do
    expect(testimonial_presenter.name).to eq("#{ testimonial.forename } #{ testimonial.surname }")
  end
end