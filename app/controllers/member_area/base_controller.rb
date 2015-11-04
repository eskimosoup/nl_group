module MemberArea
  class BaseController < ApplicationController

    layout 'member_area'

    def index
    end

    def referees_and_emergency_contact
      @presented_referees = BaseCollectionPresenter.new(collection: current_member_profile.referees, view_template: view_context,
          presenter: RefereePresenter)
      emergency_contact = current_member_profile.emergency_contact
      @presented_emergency_contact = EmergencyContactPresenter.new(object: emergency_contact, view_template: view_context) if emergency_contact
    end

    def occupational_health_screening
      basic_medical_history = current_member_profile.basic_medical_history
      @presented_basic_medical_history = BasicMedicalHistoryPresenter.new(object: basic_medical_history, view_template: view_context) if basic_medical_history
      tb_check = current_member_profile.tuberculosis_chicken_pox_check
      @presented_tuberculosis_chicken_pox_check = TuberculosisChickenPoxCheckPresenter.new(object: tb_check, view_template: view_context) if tb_check
    end

    private

    def current_member_profile
      @current_member_profile ||= MemberProfile.find_by(auth_token: cookies[:auth_token]) if cookies[:auth_token]
    end
    helper_method :current_member_profile

    def presented_current_member_profile
      @presented_current_member_profile ||= MemberProfilePresenter.new(object: current_member_profile,
                                                         view_template: view_context) if current_member_profile.present?
    end
    helper_method :presented_current_member_profile

  end
end