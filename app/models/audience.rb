class Audience < ActiveRecord::Base
  NAMES = ["Care Seekers".freeze, "Job Seekers".freeze].freeze

  has_and_belongs_to_many :frequently_asked_questions
  has_and_belongs_to_many :testimonials
  has_and_belongs_to_many :work_reasons

  validates :name, presence: true, uniqueness: true, inclusion: { in: NAMES }
end
