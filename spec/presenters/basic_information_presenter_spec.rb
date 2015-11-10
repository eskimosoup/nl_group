require "rails_helper"

RSpec.describe BasicInformationPresenter, type: :presenter do
  let(:basic_information){ build(:basic_information) }
  subject(:basic_information_presenter){ BasicInformationPresenter.new(object: basic_information, view_template: view) }

  it "should return the title" do
    expect(basic_information_presenter.title).to eq(basic_information.title)
  end

  it "should return the first_name" do
    expect(basic_information_presenter.first_name).to eq(basic_information.first_name)
  end

  it "should return the middle names" do
    expect(basic_information_presenter.middle_names).to eq(basic_information.middle_names)
  end

  it "should return the last_name" do
    expect(basic_information_presenter.last_name).to eq(basic_information.last_name)
  end

  it "should return the mobile_number" do
    expect(basic_information_presenter.mobile_number).to eq(basic_information.mobile_number)
  end

  it "should return the home_number" do
    expect(basic_information_presenter.home_number).to eq(basic_information.home_number)
  end

  it "should return the email_address" do
    expect(basic_information_presenter.email_address).to eq(basic_information.email_address)
  end

  it "should return yes if name changed" do
    basic_information.changed_name = true
    expect(basic_information_presenter.changed_name).to eq("Yes")
  end

  it "should return no if name not changed" do
    basic_information.changed_name = false
    expect(basic_information_presenter.changed_name).to eq("No")
  end

  it "should return using current name since" do
    expect(basic_information_presenter.using_current_name_since).to eq(l(basic_information.using_current_name_since))
  end

  it "should return the previous_names" do
    expect(basic_information_presenter.previous_names).to eq(basic_information.previous_names)
  end

  it "should return a localised date_of_birth" do
    expect(basic_information_presenter.date_of_birth).to eq(l(basic_information.date_of_birth))
  end

  it "should return national_insurance_number" do
    expect(basic_information_presenter.national_insurance_number).to eq(basic_information.national_insurance_number)
  end

  it "should return where_heard" do
    expect(basic_information_presenter.where_heard).to eq(basic_information.where_heard)
  end

  it "should return referred_by" do
    expect(basic_information_presenter.referred_by).to eq(basic_information.referred_by)
  end
end