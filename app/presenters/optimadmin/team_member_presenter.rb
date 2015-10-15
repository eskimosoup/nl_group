module Optimadmin
  class TeamMemberPresenter < Optimadmin::BasePresenter
    presents :team_member
    delegate :id, to: :team_member

    def name
      [forename, surname].join(" ")
    end

    def forename
      team_member.forename
    end

    def surname
      team_member.surname
    end
  end
end
