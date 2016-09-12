module Optimadmin
  class WorkablePullsController < Optimadmin::ApplicationController
    def create
      puller = WorkablePull.new
      puller.import_all!
      redirect_to root_path, notice: "Workable import completed"
    end
  end
end
