class Goal < ApplicationRecord
  belongs_to :user
  has_many :donations
  has_one :favorite
  monetize :amount_cents

  def total_approved_donations
    self.donations.where(donations: { status: :confirmed }).sum :amount_actual_cents
  end
end
