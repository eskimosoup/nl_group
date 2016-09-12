# Reasons to work for NL Group
class WorkReason < ActiveRecord::Base
  THEMES = %w( green dark_blue ).freeze

  mount_uploader :image, WorkReasonUploader

  has_and_belongs_to_many :audiences

  validates :title, :image, :summary, :colour, presence: true
  validates :colour, presence: true, inclusion: { in: THEMES }
  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true) }
end
