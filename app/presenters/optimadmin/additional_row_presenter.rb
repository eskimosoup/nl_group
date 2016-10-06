module Optimadmin
  class AdditionalRowPresenter < Optimadmin::BasePresenter
    presents :additional_row
    delegate :maximum_content_blocks, :name, :id, :audiences, to: :additional_row

    def style
      additional_row.style.present? ? additional_row.style.humanize : 'Default'
    end

    def edit_content_blocks
      h.link_to "Manage #{h.pluralize(additional_row.additional_blocks_count, 'block')}", h.additional_blocks_path(additional_row_id: id) if maximum_content_blocks.blank? || maximum_content_blocks >= 1
    end

    def row_audiences
      audiences.map(&:name).join(', ')
    end

    def audiences?
      audiences.present?
    end
  end
end
