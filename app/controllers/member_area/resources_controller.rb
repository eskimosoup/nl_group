module MemberArea
  class ResourcesController < MemberArea::BaseController
    def index
      @resources = Resource.displayed
    end
  end
end