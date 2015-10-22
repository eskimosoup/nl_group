class LandingPageConstraint
  def initialize
  end

  def matches?(request)
    # TODO cache this, invalidate cache when landing page added/slug changed
    FriendlyId::Slug.where(sluggable_type: "LandingPage").exists?(slug: request.parameters[:id])
  end
end