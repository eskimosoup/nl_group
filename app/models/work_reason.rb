# Reasons to work for NL Group
class WorkReason < ActiveRecord::Base
  THEMES = %w( light_green dark_blue dark_green light_blue )

  mount_uploader :image, WorkReasonUploader
  validates :title, :image, :summary, :colour, presence: true
  validates :colour, presence: true, inclusion: { in: THEMES }
  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true) }
end
