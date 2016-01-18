class AdditionalRowPresenter < BasePresenter
  presents :additional_row
  delegate :id, :name, :visible_title, to: :additional_row

  def additional_blocks
    additional_row.additional_blocks.displayed.positioned
  end

  def style
    additional_row.style.present? ? additional_row.style : 'default'
  end

  def anchor
    additional_row.custom_path.tr('/#', '')
  end
end
