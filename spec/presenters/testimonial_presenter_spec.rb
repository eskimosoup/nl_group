require "rails_helper"

RSpec.describe TestimonialPresenter, type: :presenter do
  let(:testimonial) { build(:testimonial) }
  subject(:testimonial_presenter) { TestimonialPresenter.new(object: testimonial, view_template: view) }

  it "should return the name" do
    expect(testimonial_presenter.name).to eq("#{ testimonial.forename } #{ testimonial.surname }")
  end

  it "should return the role" do
    expect(testimonial_presenter.role).to eq(testimonial.role)
  end

  it "should escape the content" do
    expect(testimonial_presenter.content).to eq(raw(testimonial.content))
  end

  it "should return nil for the show image" do
    expect(testimonial_presenter.show_image).to eq(nil)
  end

  it "should return an empty string for the video" do
    expect(testimonial_presenter.video).to eq("")
  end

  describe "with image" do
    let(:testimonial) { build(:testimonial_with_image) }
    subject(:testimonial_presenter) { TestimonialPresenter.new(object: testimonial, view_template: view) }

    it "should return the show image" do
      expect(testimonial_presenter.show_image).to eq(image_tag(testimonial.image.show))
    end
  end

  describe "with video embed code" do
    let(:testimonial) { build(:testimonial, video_embed_code: '<iframe width="560" height="315" src="https://www.youtube.com/embed/U5TqIdff_DQ?list=PL6Uu6NhrmUZkC18JWfZbITuKClSyegBzH" frameborder="0" allowfullscreen></iframe>') }
    subject(:testimonial_presenter) { TestimonialPresenter.new(object: testimonial, view_template: view) }

    it "should return the escaped embed code" do
      expect(testimonial_presenter.video).to eq(raw(testimonial.video_embed_code))
    end
  end


end