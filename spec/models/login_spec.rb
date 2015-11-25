require 'rails_helper'

RSpec.describe Login, type: :model do

  subject { create(:login) }

  describe "associations", :association do
    it { should belong_to(:member_profile) }
    it { should delegate_method(:full_name).to(:member_profile) }
  end

  it "#time" do
    expect(subject.time).to eq(subject.created_at.strftime("%-d %b %Y - %H:%M"))
  end

end
