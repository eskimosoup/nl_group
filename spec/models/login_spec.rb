require 'rails_helper'

RSpec.describe Login, type: :model do

  describe "associations", :association do
    it { should belong_to(:member_profile) }
  end

end
