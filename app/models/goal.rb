class Goal < ApplicationRecord
  belongs_to :user
  has_many :donations
  monetize :amount_cents

  def total_approved_donations
    self.donations.where(donations: { status: :confirmed }).sum :amount_actual_cents
  end
end
