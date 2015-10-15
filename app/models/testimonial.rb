class Testimonial < ActiveRecord::Base

  mount_uploader :image, TestimonialUploader

  validates :forename, :surname, :role, :content, presence: true
end
