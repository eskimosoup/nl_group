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
    let(:team_member) { create(:team_member_with_image) }
    subject(:team_member_presenter) { TeamMemberPresenter.new(object: team_member, view_template: view) }

    it "should return the index image" do
      expect(team_member_presenter.index_image).to eq(image_tag(team_member.image.index))
    end

    it "should return the show image" do
      expect(team_member_presenter.show_image).to eq(image_tag(team_member.image.show))
    end
    it "should return image with click through" do
      expect(team_member_presenter.profile_preview).to eq(link_to team_member_presenter.index_image(alt: team_member_presenter.name), team_member, class: 'colorbox animate-hover')
    end
  end

  describe "homepage classes" do
    let(:team_member) { build(:team_member) }
    subject(:team_member_presenter) { TeamMemberPresenter.new(object: team_member, view_template: view) }

    it "should always return small-2 columns" do
      expect(team_member_presenter.homepage_classes).to eq("small-2 columns")
    end

    it "should be offset 2 if the outer loop index is 5" do
      expect(team_member_presenter.homepage_classes(outer_loop: 5)).to eq("small-2 columns small-offset-6")
    end

    it "should offset 2 if the outer loop index is 0 and the inner loop is 1" do
      expect(team_member_presenter.homepage_classes(outer_loop: 0, inner_loop: 1)).to eq("small-2 columns small-offset-2")
    end

    it "should offset 2 and end if the outer loop index is 1 and the inner loop is 1" do
      expect(team_member_presenter.homepage_classes(outer_loop: 1, inner_loop: 1)).to eq("small-2 columns small-offset-2 end")
    end

    it "should offset 4 and end if the outer loop index is 4 and the inner loop is 2" do
      expect(team_member_presenter.homepage_classes(outer_loop: 4, inner_loop: 2)).to eq("small-2 columns small-offset-4 end")
    end

    it "should offset 2 if the outer loop index is 3 and the inner loop is 1" do
      expect(team_member_presenter.homepage_classes(outer_loop: 3, inner_loop: 1)).to eq("small-2 columns small-offset-2")
    end

    it "should end if the outer loop index is 3 and the inner loop is 3" do
      expect(team_member_presenter.homepage_classes(outer_loop: 3, inner_loop: 3)).to eq("small-2 columns end")
    end

    it "should offset 2 if the outer loop index is 2 and the inner loop is 0" do
      expect(team_member_presenter.homepage_classes(outer_loop: 2, inner_loop: 0)).to eq("small-2 columns small-offset-2")
    end

    it "should offset 2 end if the outer loop index is 2 and the inner loop is 2" do
      expect(team_member_presenter.homepage_classes(outer_loop: 2, inner_loop: 2)).to eq("small-2 columns small-offset-2 end")
    end

    it "should end if the outer loop index is 2 and the inner loop is 3" do
      expect(team_member_presenter.homepage_classes(outer_loop: 2, inner_loop: 3)).to eq("small-2 columns end")
    end
  end
end
