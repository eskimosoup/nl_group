class TestimonialPresenter < BasePresenter
  presents :testimonial
  delegate :id, to: :testimonial

  def forename
    testimonial.forename
  end

  def surname
    testimonial.surname
  end

  def name
    [forename, surname].join(" ")
  end

  def role
    testimonial.role
  end

  def content
    h.raw testimonial.content
  end

  def video_embed_code
    h.raw testimonial.video_embed_code
  end
end
