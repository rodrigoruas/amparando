class Campaign < ApplicationRecord
  monetize :price_cents
  has_many :donations, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  validates :title, :description, :short_description, presence: true
  validates :short_description, length: { maximum: 140}
end
