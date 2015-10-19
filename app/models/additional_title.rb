class AdditionalTitle < ActiveRecord::Base
  belongs_to :additional_block
  has_one :additional_animation, dependent: :destroy

  validates :additional_block_id, :content, presence: true

  accepts_nested_attributes_for :additional_animation
  validates_associated :additional_animation

  scope :displayed, -> { where(display: true) }
end
