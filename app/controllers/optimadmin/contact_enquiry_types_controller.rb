class Optimadmin::ContactEnquiryTypesController < Optimadmin::ApplicationController
  def index
    @contact_enquiry_types = ContactEnquiryType.all
  end

  def new
    @contact_enquiry_type = ContactEnquiryType.new
  end

  def create
    @contact_enquiry_type = ContactEnquiryType.new(contact_enquiry_type_params)
    if @contact_enquiry_type.save
      redirect_to contact_enquiry_types_path, notice: 'Contact enquiry type saved'
    else
      render :new
    end
  end

  def edit
    @contact_enquiry_type = find_contact_enquiry_type
  end

  def update
    @contact_enquiry_type = find_contact_enquiry_type
    if @contact_enquiry_type.update(contact_enquiry_type_params)
      redirect_to contact_enquiry_types_path, notice: 'Contact enquiry type saved'
    else
      render :new
    end
  end

  def destroy
    @contact_enquiry_type = find_contact_enquiry_type
    @contact_enquiry_type.destroy
    redirect_to contact_enquiry_types_path, notice: 'Contact enquiry type destroyed'
  end

  private

  def find_contact_enquiry_type
    ContactEnquiryType.find(params[:id])
  end

  def contact_enquiry_type_params
    params.require(:contact_enquiry_type).permit(
      :enquiry_type, :display
    )
  end
end
