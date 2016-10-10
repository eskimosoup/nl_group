class PagesController < ApplicationController
  before_action :set_page

  def show
    return redirect_to @page, status: :moved_permanently if request.path != page_path(@page)
    find_audience
    @header_menu = find_navigation
    render layout: @page.layout
  end

  private

  def set_page
    @page = Page.displayed.friendly.find(params[:id])
    @presented_page = PagePresenter.new(object: @page, view_template: view_context)
  end

  def find_navigation
    navigation_menu = @audience.present? ? @audience.navigation_menu_name : 'header'
    Optimadmin::Menu.new(name: navigation_menu)
  end

  def find_audience
    @audience = Audience.find_by(name: @page.layout.humanize.titleize)
  rescue
    nil
  end
end
