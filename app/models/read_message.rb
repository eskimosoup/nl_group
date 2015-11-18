class ReadMessage < ActiveRecord::Base
  belongs_to :member_profile
  belongs_to :admin_message
end
