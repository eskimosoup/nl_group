class AdditionalParagraph < ActiveRecord::Base
  belongs_to :additional_block
  has_one :additional_animation, dependent: :destroy

  validates :additional_block_id, :name, :content, presence: true

  accepts_nested_attributes_for :additional_animation
  validates_associated :additional_animation

  scope :displayed, -> { where(display: true) }
end
