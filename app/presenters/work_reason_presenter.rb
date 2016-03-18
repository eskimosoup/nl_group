class WorkReasonPresenter < BasePresenter
  presents :work_reason
  delegate :id, :title, to: :work_reason

  def linked_title
    h.link_to "#reason-#{id}", class: 'display-block toggle-class', data: { container: "#reason-#{id}", class: 'hide-for-small', return: 'false' } do
      h.concat(
        h.image_tag 'components/icons/reveal-arrow.png',
                    alt: 'Reveal more', class: 'show-for-small'
      )
      h.concat(
        title
      )
    end
  end

  def summary
    h.raw work_reason.summary
  end

  def class_colour
    work_reason.colour.tr('_', '-')
  end
end
