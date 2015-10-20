module Optimadmin
  class AdditionalBlockPresenter < Optimadmin::BasePresenter
    presents :additional_block
    delegate :name, :id, :style, to: :additional_block

    def style
      additional_block.style.humanize
    end

    def manage_buttons
      h.link_to 'Manage Buttons', h.additional_buttons_path(additional_block_id: id)
    end

    def edit_title
      additional_block.additional_title.present? ? (h.link_to octicon('pencil'), h.edit_additional_title_path(additional_block.additional_title, additional_block_id: id)) : (h.link_to octicon('diff'), h.new_additional_title_path(additional_block_id: id))
    end

    def destroy_title
      return nil unless additional_block.additional_title.present?
      h.link_to octicon('trashcan'), h.additional_title_path(additional_block.additional_title), method: :delete, data: { confirm: 'Are you sure you wish to remove the title?' }, class: 'right'
    end

    def destroy_paragraphs
      return nil unless additional_block.additional_paragraph.present?
      h.link_to octicon('trashcan'), h.additional_paragraph_path(additional_block.additional_paragraph), method: :delete, data: { confirm: 'Are you sure you wish to remove the content?' }, class: 'right'
    end

    def edit_paragraphs
      additional_block.additional_paragraph.present? ? (h.link_to octicon('pencil'), h.edit_additional_paragraph_path(additional_block.additional_paragraph, additional_block_id: id)) : (h.link_to octicon('diff'), h.new_additional_paragraph_path(additional_block_id: id))
    end
  end
end
