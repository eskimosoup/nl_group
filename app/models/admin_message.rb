class AdminMessage < ActiveRecord::Base
  validates :title, :content, presence: true
end
