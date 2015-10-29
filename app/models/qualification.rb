class Qualification < ActiveRecord::Base
  belongs_to :member_qualification

  validates :name, :grade_obtained, :completed_date, presence: true
  validate :completed_date_not_in_future

  def completed_date_not_in_future
    errors.add(:completed_date, "can't be in the future") if completed_date && completed_date > Date.today
  end
end
