class AdditionalRowPresenter < BasePresenter
  presents :additional_row
  delegate :style, :name, to: :additional_row

  def additional_blocks
    additional_row.additional_blocks.displayed.positioned
  end
end
