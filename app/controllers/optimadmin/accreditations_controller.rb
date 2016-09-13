module Optimadmin
  class AccreditationsController < Optimadmin::ApplicationController
    edit_images_for Accreditation, [[:logo, { show: ['fill', 132, 132] }]]

    def index
      @accreditations = Accreditation.order(:position)
    end

    def new
      @accreditation = Accreditation.new
    end

    def create
      @accreditation = Accreditation.new(accreditation_params)
      if @accreditation.save
        redirect_to accreditations_path, notice: 'Accreditation saved'
      else
        render :new
      end
    end

    def edit
      @accreditation = find_accreditation
    end

    def update
      @accreditation = find_accreditation
      if @accreditation.update(accreditation_params)
        redirect_to accreditations_path, notice: 'Accreditation saved'
      else
        render :new
      end
    end

    def destroy
      @accreditation = find_accreditation
      @accreditation.destroy
      redirect_to accreditations_path, notice: 'Accreditation destroyed'
    end

    private

    def find_accreditation
      Accreditation.find(params[:id])
    end

    def accreditation_params
      params.require(:accreditation).permit(
        :name, :logo, :logo_cache, :remote_logo_url, :link, :display
      )
    end
  end
end
