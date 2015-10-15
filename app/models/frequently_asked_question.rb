class FrequentlyAskedQuestion < ActiveRecord::Base
  validates :question, presence: true, uniqueness: true
  validates :answer, presence: true

  scope :displayed, -> { where(display: true) }
  scope :ordered, -> { order(:question) }
end
