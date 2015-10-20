require "rails_helper"

RSpec.describe Optimadmin::PagePresenter, type: :presenter do
  let(:page) { build(:page) }
  subject(:page_presenter) { Optimadmin::PagePresenter.new(object: page, view_template: view) }

  it "should return the id" do
    expect(page_presenter.id).to eq(page.id)
  end

  it "should return the title" do
    expect(page_presenter.title).to eq(page.title)
  end

  it "should return the rawed content" do
    expect(page_presenter.content).to eq(raw(page.content))
  end

  it "should return toggle title" do

    toggle_title = link_to "#index-list-#{page.id}", class: 'toggle-module-list-index helper-link',
                             data: { container: "index-list-#{page.id}", class: 'hide', return: 'true',
                                     this_class: 'octicon-chevron-up octicon-chevron-down' } do
      content_tag(:span, '', class: "octicon octicon-chevron-down") + page.title
    end

    expect(page_presenter.toggle_title).to eq(toggle_title)
  end
end