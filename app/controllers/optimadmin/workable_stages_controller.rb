module Optimadmin
  class WorkableStagesController < Optimadmin::ApplicationController
    before_action :set_workable_stage, only: [:show, :edit, :update, :destroy]

    def index
      @workable_stages = Optimadmin::BaseCollectionPresenter.new(collection: WorkableStage.order(position: :asc), view_template: view_context, presenter: Optimadmin::WorkableStagePresenter)
    end

    def show
    end

    def new
      @workable_stage = WorkableStage.new
    end

    def edit
    end

    def create
      @workable_stage = WorkableStage.new(workable_stage_params)
      if @workable_stage.save
        redirect_to workable_stages_url, notice: 'Workable stage was successfully created.'
      else
        render :new
      end
    end

    def update
      if @workable_stage.update(workable_stage_params)
        redirect_to workable_stages_url, notice: 'Workable stage was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @workable_stage.destroy
      redirect_to workable_stages_url, notice: 'Workable stage was successfully destroyed.'
    end

  private


    def set_workable_stage
      @workable_stage = WorkableStage.find(params[:id])
    end

    def workable_stage_params
      params.require(:workable_stage).permit(:slug, :name, :kind, :position, :pull_candidates)
    end
  end
end
