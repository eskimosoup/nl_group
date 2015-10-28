require "rails_helper"

RSpec.describe MemberAddressPresenter, type: :presenter do
  let(:member_address) { create(:member_address) }
  subject(:member_address_presenter){ MemberAddressPresenter.new(object: member_address, view_template: view) }

  it "should return the address" do
    expect(member_address_presenter.address).to eq(member_address.address)
  end

  it "should return lived_here_from" do
    expect(member_address_presenter.lived_here_from).to eq(l member_address.lived_here_from)
  end

  it "should return lived_here_to" do
    expect(member_address_presenter.lived_here_to).to eq(l member_address.lived_here_to)
  end

  it "should return a link to edit the address" do
    link = link_to "Edit", edit_member_area_member_address_path(member_address), id: "edit-member-address-#{ member_address.id }"
    expect(member_address_presenter.edit_link).to eq(link)
  end

  describe "current address" do
    let(:member_address) { create(:member_address, current: true, lived_here_to: nil) }
    subject(:member_address_presenter){ MemberAddressPresenter.new(object: member_address, view_template: view) }

    it "should return lived_here_to as current" do
      expect(member_address_presenter.lived_here_to).to eq("Current address")
    end
  end
end