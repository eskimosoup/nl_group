class BaseCollectionPresenter

  array_methods = Array.instance_methods - Object.instance_methods
  delegate :==, *array_methods, to: :presented_collection

  delegate :current_page, :total_pages, :limit_value, to: :collection
  delegate :size, to: :presented_collection

  attr_reader :collection, :presenter, :view_template

  def initialize(collection:, view_template:, presenter:)
    @collection = collection
    @view_template = view_template
    @presenter = presenter
  end

  def presented_collection
    @presented_collection ||= collection.map{|item| present_item(item) }
  end

  def each(&block)
    presented_collection.each(&block)
  end

  def split_array(array, sizes)
    grouped_array = []
    array_index = 0
    sizes.each do |array_size|
      break if array[array_index, array_size].blank?
      grouped_array << array[array_index, array_size]
      array_index += array_size
    end
    grouped_array
  end

  protected

  def present_item(item)
    presenter.new(object: item, view_template: view_template)
  end
end