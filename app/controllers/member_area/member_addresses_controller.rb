module MemberArea
  class MemberAddressesController < MemberArea::BaseController

    before_action :set_address, only: [:edit, :update]

    def index
      @member_addresses = current_member_profile.member_addresses
    end

    def new
      @member_address = current_member_profile.member_addresses.new
    end

    def create
      @member_address = current_member_profile.member_addresses.new(member_address_params)
      if @member_address.save
        redirect_to member_area_member_addresses_path, notice: "Address was successfully saved"
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @member_address.update(member_address_params)
        redirect_to member_area_member_addresses_path, notice: "Address was successfully updated"
      else
        render :new
      end
    end

    private

    def set_address
      @member_address = current_member_profile.member_addresses.find(params[:id])
    end

    def member_address_params
      params.require(:member_address).permit(:address, :lived_here_from, :lived_here_to, :current)
    end
  end
end