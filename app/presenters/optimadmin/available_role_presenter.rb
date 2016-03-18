module Optimadmin
  class AvailableRolePresenter < Optimadmin::BasePresenter
    presents :available_role
    delegate :id, :title, to: :available_role

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.link_to available_role.rates_of_pay, available_role.workable_link
    end
  end
end
