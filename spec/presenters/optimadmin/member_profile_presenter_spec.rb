require "rails_helper"

RSpec.describe Optimadmin::MemberProfilePresenter, type: :presenter do
  let(:member_profile) { build(:member_profile) }
  subject { Optimadmin::MemberProfilePresenter.new(object: member_profile, view_template: view) }

  it { should delegate_method(:id).to(:member_profile) }
  it { should delegate_method(:team_member_full_name).to(:member_profile) }

  it "#email" do
    expect(subject.email).to eq(member_profile.email)
  end

end