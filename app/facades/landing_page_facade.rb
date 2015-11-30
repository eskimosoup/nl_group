class LandingPageFacade
  attr_reader :landing_page

  def initialize(landing_page)
    @landing_page = landing_page
  end

  def landing_page_contents
    @landing_page_contents ||= landing_page.landing_page_contents
  end

  def landing_page_why_works
    @landing_page_why_works ||= landing_page.landing_page_why_works.displayed.order(position: :asc)
  end

  def testimonials
    @testimonials ||= landing_page.testimonials
  end

  def frequently_asked_questions
    @frequently_asked_questions ||= landing_page.frequently_asked_questions
  end

end