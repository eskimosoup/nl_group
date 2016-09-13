class AudiencesController < ApplicationController
  def show
    @audience = Audience.find(params[:id])
  end
end
