require "rails_helper"

RSpec.describe TeamMemberPresenter, type: :presenter do
  let(:team_member) { build(:team_member) }
  subject(:team_member_presenter) { TeamMemberPresenter.new(object: team_member, view_template: view) }

  it "should return the forename" do
    expect(team_member_presenter.forename).to eq(team_member.forename)
  end

  it "should return the surname" do
    expect(team_member_presenter.surname).to eq(team_member.surname)
  end

  it "should return the name" do
    expect(team_member_presenter.name).to eq("#{ team_member.forename } #{ team_member.surname }")
  end

  it "should return the role" do
    expect(team_member_presenter.role).to eq(team_member.role)
  end

  it "should return the profile" do
    expect(team_member_presenter.profile).to eq(raw(team_member.profile))
  end

  it "should return the phone number" do
    expect(team_member_presenter.phone).to eq(team_member.phone)
  end

  it "should return the email in a mail to link" do
    expect(team_member_presenter.email).to eq(mail_to(team_member.email))
  end

  it "should return nil for the index image" do
    expect(team_member_presenter.index_image).to eq(nil)
  end

  it "should return nil for the show image" do
    expect(team_member_presenter.show_image).to eq(nil)
  end

  it "should return nil for the profile" do
    expect(team_member_presenter.profile_preview).to eq(nil)
  end

  describe "team member has nil attributes" do
    let(:team_member) { build(:team_member, profile: nil, email: nil, phone: nil) }
    subject(:team_member_presenter) { TeamMemberPresenter.new(object: team_member, view_template: view) }

    it "should return an empty string for the profile" do
      expect(team_member_presenter.profile).to eq("")
    end

    it "should return nil for the phone number" do
      expect(team_member_presenter.phone).to eq(nil)
    end

    it "should return nil for the email" do
      expect(team_member_presenter.email).to eq(nil)
    end
  end

  describe "with image" do
    let(:team_member) { build(:team_member_with_image) }
    subject(:team_member_presenter) { TeamMemberPresenter.new(object: team_member, view_template: view) }

    it "should return the index image" do
      expect(team_member_presenter.index_image).to eq(image_tag(team_member.image.index))
    end

    it "should return the show image" do
      expect(team_member_presenter.show_image).to eq(image_tag(team_member.image.show))
    end
    it "should return image with click through" do
      expect(team_member_presenter.profile_preview).to eq(link_to team_member_presenter.index_image(alt: team_member_presenter.name), team_member, class: 'colorbox')
    end
  end
end
