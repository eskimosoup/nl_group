class TeamMemberPresenter < BasePresenter
  presents :team_member

  def forename
    team_member.forename
  end

  def surname
    team_member.surname
  end

  def name
    [forename, surname].join(' ')
  end

  def role
    team_member.role
  end

  def profile
    h.raw team_member.profile
  end

  def phone
    team_member.phone
  end

  def email(options = {})
    h.mail_to team_member.email, team_member.email, options if team_member.email
  end

  def profile_preview(text = 'Click for more information', classes = '')
    h.link_to text, team_member,
              class: "team-member-modal-toggle #{classes}",
              rel: 'gallery',
              remote: true
  end

  def index_profile_preview
    h.link_to index_image(alt: name), team_member,
              class: 'colorbox css-animated-hover',
              data: { class: 'tada' } if team_member.image.present?
  end
end
