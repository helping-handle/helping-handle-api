class Goal < ApplicationRecord
  belongs_to :user
  has_many :donations
  has_one :favorite
  monetize :amount_cents

  def amount_total
    self.donations.confirmed.sum :amount_actual_cents
  end

  def amount_percent
    Money.new(self.amount_total) / Money.new(self.amount_cents)
  end
end
