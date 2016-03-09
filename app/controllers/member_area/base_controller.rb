module MemberArea
  class BaseController < ApplicationController
    layout 'member_area'

    before_action :use_pdf_specific_template, only: [:registration_data]

    def index
      redirect_to member_area_member_profile_url if current_member_profile.present?
    end

    def application_form_overview
    end

    def referees_and_emergency_contact
      @referees = current_member_profile.referees
      @emergency_contact = current_member_profile.emergency_contact
    end

    def occupational_health_screening
      basic_medical_history = current_member_profile.basic_medical_history
      @presented_basic_medical_history = BasicMedicalHistoryPresenter.new(object: basic_medical_history, view_template: view_context) if basic_medical_history
      tb_check = current_member_profile.tuberculosis_chicken_pox_check
      @presented_tuberculosis_chicken_pox_check = TuberculosisChickenPoxCheckPresenter.new(object: tb_check, view_template: view_context) if tb_check
      immunisation_history = current_member_profile.immunisation_history
      @presented_immunisation_history = ImmunisationHistoryPresenter.new(object: immunisation_history, view_template: view_context) if immunisation_history
    end

    def registration_data
      @registration_data = RegistrationData.new(current_member_profile)
      respond_to do |format|
        format.html
        format.pdf do
          render pdf: 'registration_data.pdf',
                 layout: 'pdf',
                 # header: { html: { template: 'layouts/pdf/header.pdf.erb'} },
                 header: { content: render_to_string('layouts/pdf/header.pdf.erb', locals: { candidate: current_member_profile.basic_information }), spacing: 5 },
                 footer: { content: render_to_string('layouts/pdf/footer.pdf.erb', locals: { candidate: current_member_profile.basic_information }), spacing: 5 }
        end
      end
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

    def use_pdf_specific_template
      return unless env['Rack-Middleware-WickedPdf']
      request.format = 'pdf'
    end
  end
end
