class AdditionalRows::Audience < ActiveRecord::Base
  belongs_to :audience,
             class_name: '::Audience'

  belongs_to :additional_row,
             class_name: '::AdditionalRow'
end
