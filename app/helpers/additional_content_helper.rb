module AdditionalContentHelper
  def render_additional_blocks(additional_row_presenter, additional_block_presenter)
    render partial: "additional_rows/block_styles/#{additional_row_presenter.style}/#{additional_block_presenter.style}", locals: { additional_row_presenter: additional_row_presenter, additional_block_presenter: additional_block_presenter }
  rescue
    nil
  end

  def render_additional_rows(additional_row_presenter)
    render partial: "additional_rows/row_styles/#{additional_row_presenter.style}", locals: { additional_row_presenter: additional_row_presenter }
  #rescue
  #  nil
  end
end
