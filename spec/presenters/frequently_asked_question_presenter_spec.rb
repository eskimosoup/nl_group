require "rails_helper"

RSpec.describe FrequentlyAskedQuestionPresenter, type: :presenter do
  let(:faq) { build(:frequently_asked_question) }
  subject(:faq_presenter){ FrequentlyAskedQuestionPresenter.new(object: faq, view_template: view) }

  it "should return the question" do
    expect(faq_presenter.question).to eq(faq.question)
  end

  it "should return the answer" do
    expect(faq_presenter.answer).to eq(raw(faq.answer))
  end
end