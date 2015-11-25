module Optimadmin
  class LoginPresenter < Optimadmin::BasePresenter
    presents :login
    delegate :id, to: :login

    def title
      #login.title
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      #h.simple_format login.summary
    end
  end
end
