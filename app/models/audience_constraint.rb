class AudienceConstraint
  def matches?(request)
    # Audience.exists?(slug: request.parameters[:id])
    FriendlyId::Slug.where(sluggable_type: 'Audience').exists?(slug: request.parameters[:id])
  end
end
