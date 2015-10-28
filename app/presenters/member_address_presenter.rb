class MemberAddressPresenter < BasePresenter
  presents :member_address

  def address
    member_address.address
  end

  def lived_here_from
    h.l member_address.lived_here_from
  end

  def lived_here_to
    return "Current address" if current_address?
    h.l member_address.lived_here_to
  end

  def current_address?
    member_address.current?
  end

  def edit_link
    h.link_to "Edit", h.edit_member_area_member_address_path(member_address),
              id: "edit-member-address-#{ id }"
  end

  private

  def id
    member_address.id
  end
end