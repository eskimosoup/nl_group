class Contact
  include ActiveModel::Model
  attr_accessor :name, :email, :phone_number, :message, :location, :enquiry_type

  validates :name, :message, :email, :phone_number, presence: true
end
