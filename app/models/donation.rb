class Donation < ApplicationRecord
  monetize :amount_cents
  belongs_to :campaign
  belongs_to :user
  before_save :default_values
  def default_values
    self.state ||= '0'
  end
end
