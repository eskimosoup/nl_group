class AdditionalBlockPresenter < BasePresenter
  presents :additional_block
  delegate :name, to: :additional_block

  def style
    additional_block.style.present? ? additional_block.style : 'default'
  end

  def presented_block(&content)
    animate_content additional_block do
      presented_block_wrap(additional_block, &content)
    end
  end

  def presented_title
    return unless additional_block.additional_title.present?
    animate_content additional_block.additional_title do
      if additional_block.additional_title.classes.blank?
        additional_block.additional_title.content
      else
        h.content_tag :span, additional_block.additional_title.content, class: additional_block.additional_title.classes
      end
    end
  end

  def presented_paragraph
    return unless additional_block.additional_paragraph.present?
    animate_content additional_block.additional_paragraph do
      if additional_block.additional_paragraph.classes.blank?
        h.raw additional_block.additional_paragraph.content
      else
        h.content_tag :div, (h.raw additional_block.additional_paragraph.content), class: additional_block.additional_paragraph.classes
      end
    end
  end

  def presented_button(index, options = {}, classes = '')
    return nil if presented_buttons[index].blank?
    button = presented_buttons[index]
    options = options.merge({ title: button.button_text })
    options = options.merge({ class: "#{"#{classes} " if classes.present?}#{"#{button.classes}" if button.classes.present?}" }) if classes.present? || button.classes.present?
    h.link_to button.button_text, button.button_link, options.merge(animation_data(button.additional_animation))
  end

  private

    def animate_content(object, &block)
      animation = object.additional_animation if object.present?
      if animation.present? && animation.animation_type.present?
        h.content_tag :div, yield(:block), animation_data(animation)
      else
        yield :block
      end
    end

    def animation_data(animation)
      if animation.present? && animation.animation_type.present?
        { data: { animation_type: animation.animation_type, animation_delay: animation.animation_delay } }
      else
        {}
      end
    end

    def presented_buttons
      buttons = []
      additional_block.additional_buttons.displayed.positioned.each do |button|
        buttons.push(button)
      end
      buttons
    end

    def presented_block_wrap(additional_block, &content)
      classes = {}
      classes = { class: additional_block.classes } if additional_block.classes.present?
      h.content_tag :div, classes.merge({data: { aria_label: additional_block.name }}) do
        yield :content
      end
    end
end
