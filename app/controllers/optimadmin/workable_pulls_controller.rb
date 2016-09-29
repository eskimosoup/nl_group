module Optimadmin
  class WorkablePullsController < Optimadmin::ApplicationController
    load_and_authorize_resource

    def create
      puller = WorkablePull.new
      puller.import_all!
      redirect_to root_path, notice: 'Workable import completed'
    end
  end
end
