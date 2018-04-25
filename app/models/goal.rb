class Goal < ApplicationRecord
  belongs_to :user
  has_many :donations
  has_one :favorite
  monetize :amount_cents

  def amount_total
    donations.confirmed.sum :amount_actual_cents
  end

  def amount_percent
    Money.new(amount_total) / Money.new(amount_cents)
  end
end
