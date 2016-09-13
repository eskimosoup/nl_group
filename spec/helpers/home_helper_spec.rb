require 'rails_helper'

RSpec.describe HomeHelper do
  describe '#home_audience_classes' do
    context 'Care Seekers' do
      it 'includes dark-blue' do
        audience = create(:audience, name: 'Care Seekers')

        expect(helper.home_audience_classes(audience)).to include('dark-blue')
      end
    end
    context 'Job Seekers' do
      it 'includes green' do
        audience = create(:audience, name: 'Job Seekers')

        expect(helper.home_audience_classes(audience)).to include('green')
      end
    end
  end

  describe '#home_audience_title' do
    context 'Care Seekers' do
      it 'includes care_seekers' do
        audience = create(:audience, name: 'Care Seekers')

        expect(helper.home_audience_title(audience)).to eq('views.homepage.care_seekers_title')
      end
    end
    context 'Job Seekers' do
      it 'includes green' do
        audience = create(:audience, name: 'Job Seekers')

        expect(helper.home_audience_title(audience)).to eq('views.homepage.job_seekers_title')
      end
    end
  end

  it '#home_audience_image' do
    audience = create(:audience, name: 'Job Seekers')

    expect(helper.home_audience_image(audience)).to eq('job_seekers.jpg')
  end

end
