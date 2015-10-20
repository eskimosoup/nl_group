class TeamMemberPresenter < BasePresenter
  presents :team_member

  def forename
    team_member.forename
  end

  def surname
    team_member.surname
  end

  def name
    [forename, surname].join(" ")
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

  def email
    h.mail_to team_member.email if team_member.email
  end

  def profile_preview
    h.link_to index_image(alt: name), team_member, class: 'colorbox animate-hover', data: { animation_type: 'pulse' } if team_member.image.present?
  end

  def homepage_classes(outer_loop: nil, inner_loop: nil)
    classes = ["small-2", "columns"]
    classes.push(*homepage_loop_classes(outer_loop, inner_loop)) if outer_loop || inner_loop
    classes.compact.join(" ")
  end

  private

  def homepage_loop_classes(outer_loop, inner_loop)
    loop_classes = []
    loop_classes <<  "small-offset-2" if homepage_offset_2?(outer_loop, inner_loop)
    loop_classes << "small-offset-4" if homepage_offset_4?(outer_loop, inner_loop)
    loop_classes << "small-offset-6" if homepage_offset_6?(outer_loop)
    loop_classes << "end" if homepage_end?(outer_loop, inner_loop)
    loop_classes
  end

  def homepage_offset_2?(outer_loop, inner_loop)
    if inner_loop == 1 && [0,1].include?(outer_loop)
      true
    elsif outer_loop == 2 && [0,2].include?(inner_loop)
      true
    elsif outer_loop == 3 && inner_loop == 1
      true
    else
      false
    end
  end

  def homepage_offset_4?(outer_loop, inner_loop)
    outer_loop == 4 && inner_loop == 2
  end

  def homepage_offset_6?(outer_loop)
    outer_loop == 5
  end

  def homepage_end?(outer_loop, inner_loop)
    if outer_loop == inner_loop && [1,2,3].include?(outer_loop)
      true
    elsif outer_loop == 2 && inner_loop == 3
      true
    elsif outer_loop == 4 && inner_loop == 2
      true
    else
      false
    end
  end
end
