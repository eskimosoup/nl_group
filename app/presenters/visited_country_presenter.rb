class VisitedCountryPresenter < BasePresenter
  presents :visited_country

  def name
    @name ||= visited_country.name
  end

  def duration
    @duration ||= visited_country.duration
  end

  def from_year
    @from_year ||= visited_country.from_year
  end

  def to_year
    @to_year ||= visited_country.to_year
  end
end