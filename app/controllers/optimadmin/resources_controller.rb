module Optimadmin
  class ResourcesController < Optimadmin::ApplicationController
    before_action :set_resource, only: [:show, :edit, :update, :destroy]

    def index
      @resources = Optimadmin::BaseCollectionPresenter.new(collection: Resource.order(position: :asc), view_template: view_context, presenter: Optimadmin::ResourcePresenter)
    end

    def show
    end

    def new
      @resource = Resource.new
    end

    def edit
    end

    def create
      @resource = Resource.new(resource_params)
      if @resource.save
        redirect_to resources_url, notice: 'Resource was successfully created.'
      else
        render :new
      end
    end

    def update
      if @resource.update(resource_params)
        redirect_to resources_url, notice: 'Resource was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @resource.destroy
      redirect_to resources_url, notice: 'Resource was successfully destroyed.'
    end

  private


    def set_resource
      @resource = Resource.find(params[:id])
    end

    def resource_params
      params.require(:resource).permit(:name, :file, :display, :position)
    end
  end
end
