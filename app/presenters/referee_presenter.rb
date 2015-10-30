class RefereePresenter < BasePresenter
  presents :referee

  def name
    referee.name
  end

  def position
    referee.position
  end

  def contact_number
    referee.contact_number
  end

  def fax_number
    referee.fax_number
  end

  def email_address
    referee.email_address
  end

  def postal_address
    referee.postal_address
  end

  def contact_referee?
    referee.contact_referee?
  end
end