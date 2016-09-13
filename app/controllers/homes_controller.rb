class HomesController < ApplicationController
  layout 'home'

  def show
    @facade = HomeFacade.new
  end
end
