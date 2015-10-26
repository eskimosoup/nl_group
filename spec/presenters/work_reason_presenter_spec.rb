require 'rails_helper'
#  rspec --tag 'work_reason'
RSpec.describe WorkReasonPresenter, type: :presenter, work_reason: true do
  let(:work_reason) { build(:work_reason) }
  subject(:work_reason_presenter) { WorkReasonPresenter.new(object: work_reason, view_template: view) }

  describe 'delegations', :delegation do
    it { should delegate_method(:id).to(:work_reason) }
    it { should delegate_method(:title).to(:work_reason) }
  end

  describe 'standard work_reason' do
    it 'returns the summary - html formatted' do
      expect(work_reason_presenter.summary).to eq(raw work_reason.summary)
    end

    # it 'returns the linked title' do
    #  expect(work_reason_presenter.linked_title).to eq(link_to "#reason-#{id}", class: 'display-block toggle-class', data: { container: "#reason-#{id}", class: 'hide-for-small', return: 'false' } {
    #    concat(
    #      h.image_tag 'components/icons/reveal-arrow.png',
    #      alt: 'Reveal more', class: 'show-for-small'
    #    )
    #    concat(
    #      title
    #    )
    #  })
    # end

    it 'returns the css class colour' do
      expect(work_reason_presenter.class_colour).to eq(work_reason.colour.tr('_', '-'))
    end
  end

  describe 'has image' do
    let(:work_reason) { build(:work_reason) }
    subject(:work_reason_presenter) { WorkReasonPresenter.new(object: work_reason, view_template: view) }

    it 'show_image should not return nil' do
      expect(work_reason_presenter.show_image(alt: work_reason.title)).to eq(image_tag(work_reason.image.show, alt: work_reason.title))
    end
  end
end
