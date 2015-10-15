module Optimadmin
  class TestimonialPresenter < Optimadmin::BasePresenter
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
  end
end
