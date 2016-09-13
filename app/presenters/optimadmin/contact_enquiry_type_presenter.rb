module Optimadmin
  class ContactEnquiryTypePresenter < Optimadmin::BasePresenter
    presents :contact_enquiry_type
    delegate :id, to: :contact_enquiry_type
  end
end
