module Optimadmin
  class AudiencesController < Optimadmin::ApplicationController
    def index
      @audiences = Audience.order(:name)
    end

    def new
      @audience = Audience.new
    end

    def create
      @audience = Audience.new(audience_params)
      if @audience.save
        redirect_to audiences_path, notice: "Audience successfully created"
      else
        render :new
      end
    end

    def edit
      @audience = find_audience
    end

    def update
      @audience = find_audience
      if @audience.update(audience_params)
        redirect_to audiences_path, notice: "Audience successfully updated"
      else
        render :edit
      end
    end

    def destroy
      audience = find_audience
      audience.destroy
      redirect_to audiences_path, notice: "Audience successfully destroyed"
    end

    private

    def find_audience
      Audience.find(params[:id])
    end

    def audience_params
      params.require(:audience).permit(
        :name, testimonial_ids: [], frequently_asked_question_ids: [],
        work_reason_ids: [],
      )
    end
  end
end
