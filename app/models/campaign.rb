class Campaign < ApplicationRecord
  monetize :price_cents
  has_many :donations, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  validates :title, :description, presence: true
end
