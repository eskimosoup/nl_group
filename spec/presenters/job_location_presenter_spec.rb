require "rails_helper"

RSpec.describe JobLocationPresenter, type: :presenter do
  let(:job_location) { build(:job_location) }
  subject{ JobLocationPresenter.new(object: job_location, view_template: view) }

  it "#country" do
    expect(subject.country).to eq(job_location.country)
  end

  it "#country_code" do
    expect(subject.country_code).to eq(job_location.country_code)
  end

  it "#region" do
    expect(subject.region).to eq(job_location.region)
  end

  it "#region_code" do
    expect(subject.region_code).to eq(job_location.region_code)
  end

  it "#city" do
    expect(subject.city).to eq(job_location.city)
  end

  it "#zip_code" do
    expect(subject.zip_code).to eq(job_location.zip_code)
  end

  describe "#telecommuting?" do
    it "#telecommuting" do
      job_location.telecommuting = true
      expect(subject.telecommuting).to eq("Yes")
    end

    it "#telecommuting" do
      job_location.telecommuting = false
      expect(subject.telecommuting).to eq("No")
    end
  end
end