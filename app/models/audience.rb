class Audience < ActiveRecord::Base
  NAMES = ['Care Seekers'.freeze, 'Job Seekers'.freeze].freeze

  has_and_belongs_to_many :frequently_asked_questions
  has_and_belongs_to_many :testimonials
  has_and_belongs_to_many :work_reasons

  has_many :additional_row_audiences,
           dependent: :destroy,
           class_name: 'AdditionalRows::Audience'
  has_many :additional_rows, through: :additional_row_audiences

  validates :name, presence: true, uniqueness: true, inclusion: { in: NAMES }
end
