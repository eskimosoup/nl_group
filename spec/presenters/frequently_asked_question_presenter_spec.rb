require "rails_helper"

RSpec.describe FrequentlyAskedQuestionPresenter, type: :presenter do
  let(:faq) { build(:frequently_asked_question) }
  subject(:faq_presenter) { FrequentlyAskedQuestionPresenter.new(object: faq, view_template: view) }

  it "should return the question" do
    expect(faq_presenter.question).to eq(faq.question)
  end

  it "should return the answer" do
    expect(faq_presenter.answer).to eq(raw(faq.answer))
  end

  it "should return the linked question" do
    expect(faq_presenter.toggle_question).to eq(link_to(faq.question, '#', class: 'toggle-class', data: { container: "#faq-#{faq.id}", class: 'hide', return: 'false' }))
  end

  it "should return the toggle div" do
    expect(faq_presenter.toggle_answer).to eq(content_tag(:div, faq.answer, id: "faq-#{faq.id}", class: 'hide'))
  end
end
