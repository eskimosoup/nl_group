class HomeFacade
  def audiences
    @audiences ||= Audience.includes(:work_reasons)
  end
end
