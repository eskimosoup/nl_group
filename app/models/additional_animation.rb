class AdditionalAnimation < ActiveRecord::Base
  belongs_to :additional_block
  belongs_to :additional_title
  belongs_to :additional_paragraph
  belongs_to :additional_button

  scope :active, -> { where(active: true) }


  ANIMATION_TYPES = ['fadeInUp']

  validates :animation_type, presence: true, allow_blank: true, inclusion: { in: ANIMATION_TYPES }
end
