require 'rails_helper'

RSpec.describe Job, type: :model do
  describe "associations", :association do
    it { should have_one(:job_location) }
  end
end
