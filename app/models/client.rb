class Client < ActiveRecord::Base
  mount_uploader :logo, ClientUploader

  validates :name, :logo, presence: true
  validates :website, format: { with: URI.regexp }, if: Proc.new{|a| a.website.present? }
end
