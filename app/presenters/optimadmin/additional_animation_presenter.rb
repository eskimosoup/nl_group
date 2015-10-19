module Optimadmin
  class AdditionalAnimationPresenter < Optimadmin::BasePresenter
    presents :additional_animation
    delegate :id, to: :additional_animation

    def title
      #additional_animation.title
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      #h.simple_format additional_animation.summary
    end
  end
end
