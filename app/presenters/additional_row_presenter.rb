class AdditionalRowPresenter < BasePresenter
  presents :additional_row
  delegate :style, :name, to: :additional_row
end
