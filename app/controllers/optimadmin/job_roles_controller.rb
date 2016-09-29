module Optimadmin
  class JobRolesController < Optimadmin::ApplicationController
    load_and_authorize_resource

    def index
      @job_roles = JobRole.order(:title)
    end

    def new
      @job_role = JobRole.new
    end

    def create
      @job_role = JobRole.new(job_role_params)
      if @job_role.save
        redirect_to job_roles_path, notice: 'Job role successfully created'
      else
        render :new
      end
    end

    def edit
      @job_role = find_job_role
    end

    def update
      @job_role = find_job_role
      if @job_role.update(job_role_params)
        redirect_to job_roles_path, notice: 'Job role successfully updated'
      else
        render :new
      end
    end

    def destroy
      @job_role = find_job_role
      @job_role.destroy
      redirect_to job_roles_path, notice: 'Job role successfully destroyed'
    end

    private

    def find_job_role
      JobRole.find(params[:id])
    end

    def job_role_params
      params.require(:job_role).permit(
        :title, :summary, :display, :link
      )
    end
  end
end
