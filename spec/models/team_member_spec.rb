require 'rails_helper'

RSpec.describe TeamMember, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:forename) }
    it { should validate_presence_of(:surname) }
    it { should validate_presence_of(:role) }
    it { should validate_presence_of(:team_member_team_id) }
  end

  it "#full_name" do
    expect(subject.full_name).to eq("#{ subject.forename } #{ subject.surname }")
  end
end
