require 'rails_helper'

RSpec.describe AvailableRolePresenter, type: :presenter, available_role: true do
  let(:available_role) { build(:available_role) }
  subject(:available_role_presenter) { AvailableRolePresenter.new(object: available_role, view_template: view) }

  describe 'delegations', :delegation do
    it { should delegate_method(:title).to(:available_role) }
    it { should delegate_method(:rates_of_pay).to(:available_role) }
    it { should delegate_method(:workable_link).to(:available_role) }
  end
end
