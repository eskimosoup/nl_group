class AdditionalRowPresenter < BasePresenter
  presents :additional_row
  delegate :id, :style, :name, to: :additional_row

  def additional_blocks
    additional_row.additional_blocks.displayed.positioned
  end

  def anchor
    "#{style.parameterize.gsub('_', '-')}-#{id}"
  end
end
