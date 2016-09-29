module Optimadmin
  # cancancan's ability class, used to check whether an admin has privileges to
  # do what they're attempting to do.
  #
  # See the wiki for details:
  # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  class AdminAbility
    include CanCan::Ability

    # Return an array of roles that the administrator can assign based on
    # their role
    #
    # @param administrator [Administrator]
    # @return [Array]
    #
    # @example
    #   Optimadmin::Ability.roles(current_administrator) #=> ['site_admin']
    def self.roles(administrator)
      ret = %w( owner )
      ret << 'master' if administrator.role == 'master'
      ret << 'candidates_only' if administrator.role == 'master'
      ret << 'content_not_candidates' if administrator.role == 'master'
      ret
    end

    # What cancancan uses to manage abilities
    # can :manage, Article  # user can perform any action on the article
    # can :read, :all       # user can read any object
    # can :manage, :all     # user can perform any action on any object
    # other actions are :read, :create, :update, :destroy
    # For any that are to be used by everyone put below the case statement
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities for more info
    #
    # @param administrator [Administrator]
    def initialize(administrator)
      case administrator.role
      when 'master'
        can :manage, :all
        # cannot :manage, Page
      when 'owner'
        can :manage, :all
        cannot :manage, Optimadmin::Administrator, role: 'master'
        cannot :manage_keys, Optimadmin::SiteSetting
        cannot :manage, Optimadmin::ModulePage
        cannot :destroy, Optimadmin::SiteSetting
        cannot :create, Optimadmin::SiteSetting
      when 'candidates_only'
        cannot :manage, :all
        can :manage, JobRole
        can :manage, ReferralOffer
        can :manage, WorkableStage
        can :manage, Resource
        can :manage, AdminMessage
        can :manage, MemberProfile
        can :manage, LoginReport
        can :manage, TimesheetReport
        can :manage, MandatoryTrainingCourse
      when 'content_not_candidates'
        can :manage, :all
        cannot :manage, Optimadmin::Administrator, role: 'master'
        cannot :manage_keys, Optimadmin::SiteSetting
        cannot :manage, Optimadmin::ModulePage
        cannot :destroy, Optimadmin::SiteSetting
        cannot :create, Optimadmin::SiteSetting
        cannot :manage, JobRole
        cannot :manage, ReferralOffer
        cannot :manage, WorkableStage
        cannot :manage, Resource
        cannot :manage, AdminMessage
        cannot :manage, MemberProfile
        cannot :manage, LoginReport
        cannot :manage, TimesheetReport
        cannot :manage, MandatoryTrainingCourse
      end
    end
  end
end
