class JobsController < ApplicationController

  def index
    @jobs = Job.includes(:job_location).published.order(workable_created_at: :desc)
  end
end