class LandingPageWhyWorkPresenter < BasePresenter
  presents :landing_page_why_work

  def title
    landing_page_why_work.title
  end

  def content
    h.raw landing_page_why_work.content
  end

  def classes
    ["reason", reason_type].join(" ")
  end

  private

  def reason_type
    landing_page_why_work.reason_type
  end
end