class FrequentlyAskedQuestionPresenter < BasePresenter
  presents :frequently_asked_question

  def question
    frequently_asked_question.question
  end

  def toggle_question
    h.link_to frequently_asked_question.question, '#', class: 'toggle-class', data: { container: "#faq-#{frequently_asked_question.id}", class: 'hide', return: 'false' }
  end

  def toggle_answer
    h.content_tag :div, id: "#faq-#{frequently_asked_question.id}", class: 'hide' do
      answer
    end
  end

  def answer
    h.raw frequently_asked_question.answer
  end
end
