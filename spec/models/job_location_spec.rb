require 'rails_helper'

RSpec.describe JobLocation, type: :model do
  describe "associations", :association do
    it { should belong_to(:job) }
  end
end
