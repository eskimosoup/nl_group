require "rails_helper"

RSpec.describe MemberProfilePresenter, type: :presenter do
  let(:member_profile) { create(:member_profile) }
  subject(:member_profile_presenter){ MemberProfilePresenter.new(object: member_profile, view_template: view) }

  it "should return the email" do
    expect(member_profile_presenter.email).to eq(member_profile.email)
  end
end