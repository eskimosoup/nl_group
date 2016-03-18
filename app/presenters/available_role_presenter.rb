class AvailableRolePresenter < BasePresenter
  presents :available_role
  delegate :title, :rates_of_pay, :workable_link, to: :available_role
end
