require "rails_helper"

RSpec.describe Optimadmin::FrequentlyAskedQuestionPresenter, type: :presenter do
  let(:faq) { build(:frequently_asked_question) }
  subject(:faq_presenter){ Optimadmin::FrequentlyAskedQuestionPresenter.new(object: faq, view_template: view) }

  it "should return the question" do
    expect(faq_presenter.question).to eq(faq.question)
  end

end