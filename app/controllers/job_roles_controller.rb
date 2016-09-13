class JobRolesController < ApplicationController
  def index
    @job_roles = JobRole.displayed
  end
end
