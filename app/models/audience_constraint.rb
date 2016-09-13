class AudienceConstraint
  def matches?(request)
    Audience.exists?(id: request.parameters[:id])
  end
end
