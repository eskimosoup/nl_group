require 'rails_helper'

RSpec.describe WhyWorkReason, type: :model do
  describe "associations", :association do
    it { should belong_to(:landing_page) }
    it { should belong_to(:landing_page_why_work) }
  end
end
