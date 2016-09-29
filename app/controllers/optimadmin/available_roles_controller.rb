module Optimadmin
  class AvailableRolesController < Optimadmin::ApplicationController
    load_and_authorize_resource
    before_action :set_available_role, only: [:show, :edit, :update, :destroy]

    def index
      @available_roles_items = AvailableRole.where('title ILIKE ?', "%#{params[:search]}%")
                                            .page(params[:page]).per(params[:per_page] || 15)

      @available_roles = Optimadmin::BaseCollectionPresenter.new(
        collection: @available_roles_items,
        view_template: view_context,
        presenter: Optimadmin::AvailableRolePresenter)
    end

    def show
    end

    def new
      @available_role = AvailableRole.new
    end

    def edit
    end

    def create
      @available_role = AvailableRole.new(available_role_params)
      if @available_role.save
        redirect_to_index_or_continue_editing(@available_role)
      else
        render :new
      end
    end

    def update
      if @available_role.update(available_role_params)
        redirect_to_index_or_continue_editing(@available_role)
      else
        render :edit
      end
    end

    def destroy
      @available_role.destroy
      redirect_to available_roles_url, notice: 'Available role was successfully destroyed.'
    end

    private

    def set_available_role
      @available_role = AvailableRole.find(params[:id])
    end

    def available_role_params
      params.require(:available_role)
            .permit(:position, :title, :rates_of_pay, :workable_link, :display)
    end
  end
end
