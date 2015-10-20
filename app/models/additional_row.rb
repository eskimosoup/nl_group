class AdditionalRow < ActiveRecord::Base
  has_many :additional_blocks, dependent: :destroy

  validates :name, presence: true

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true) }
end
