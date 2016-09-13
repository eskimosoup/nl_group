module Optimadmin
  class JobRolePresenter < Optimadmin::BasePresenter
    presents :job_role
    delegate :id, to: :job_role
  end
end
