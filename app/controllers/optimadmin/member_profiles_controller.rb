module Optimadmin
  class MemberProfilesController < Optimadmin::ApplicationController
    before_action :set_member_profile, only: [:show, :edit, :update, :destroy]

    def index
      @member_profiles = Optimadmin::BaseCollectionPresenter.new(collection: MemberProfile.where('email ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::MemberProfilePresenter)
    end

    def show
    end

    def new
      @member_profile = MemberProfile.new
    end

    def edit
    end

    def create
      @member_profile = MemberProfile.new(member_profile_params)
      if @member_profile.save
        redirect_to member_profiles_url, notice: 'Member profile was successfully created.'
      else
        render :new
      end
    end

    def update
      if @member_profile.update(member_profile_params)
        redirect_to member_profiles_url, notice: 'Member profile was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @member_profile.destroy
      redirect_to member_profiles_url, notice: 'Member profile was successfully destroyed.'
    end

  private


    def set_member_profile
      @member_profile = MemberProfile.find(params[:id])
    end

    def member_profile_params
      params.require(:member_profile).permit(:email, :team_member_id, :active)
    end
  end
end
