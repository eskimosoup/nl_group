module Optimadmin
  class AdditionalButtonPresenter < Optimadmin::BasePresenter
    presents :additional_button
    delegate :id, :button_text, to: :additional_button

    def view_link
      h.link_to eye, additional_button.button_link, class: 'menu-item-control'
    end
  end
end
