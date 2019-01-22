class Donation < ApplicationRecord
  monetize :amount_cents
  belongs_to :campaign
end
