module Optimadmin
  class AccreditationPresenter < Optimadmin::BasePresenter
    presents :accreditation
    delegate :id, to: :accreditation
  end
end
