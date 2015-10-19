module Optimadmin
  class AdditionalRowPresenter < Optimadmin::BasePresenter
    presents :additional_row
    delegate :name, :id, to: :additional_row

    def edit_content_blocks
      h.link_to "Manage #{h.pluralize(additional_row.additional_blocks_count, 'block')}", h.additional_blocks_path(additional_row_id: id)
    end

    def style
      additional_row.style.humanize
    end
  end
end
