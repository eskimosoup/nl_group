module HomeHelper
  def home_audience_classes(audience)
    classes = ['audience']
    classes << 'green' if audience.name == 'Job Seekers'
    classes << 'dark-blue' if audience.name == 'Care Seekers'
    classes.join(' ')
  end

  def home_audience_title(audience)
    "views.homepage.#{audience.name.downcase.tr(' ', '_')}_title"
  end

  def home_audience_image(audience)
    "#{audience.name.downcase.tr(' ', '_')}.jpg"
  end
end
