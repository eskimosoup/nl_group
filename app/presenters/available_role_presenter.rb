class AvailableRolePresenter < BasePresenter
  presents :available_role
  delegate :title, :rates_of_pay, to: :available_role
end
