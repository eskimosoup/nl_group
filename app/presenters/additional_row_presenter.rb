class AdditionalRowPresenter < BasePresenter
  presents :additional_row
  delegate :id, :name, to: :additional_row

  def additional_blocks
    additional_row.additional_blocks.displayed.positioned
  end

  def style
    additional_row.style.present? ? additional_row.style : 'default'
  end

  def anchor
    "row-#{id}"
  end
end
