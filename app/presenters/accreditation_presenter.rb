
class AccreditationPresenter < BasePresenter
  presents :accreditation
  delegate :id, to: :accreditation

  def show
    if accreditation.link.present?
      linked_text(show_logo)
    else
      show_logo
    end
  end

  def linked_text(text = 'View', options = {})
    h.link_to text,
              accreditation.link,
              options.merge(target: '_blank', rel: 'noopener')
  end
  end
