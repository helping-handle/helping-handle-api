class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :goal
  monetize :amount_cents, :amount_actual_cents
  enum status: %i[created confirmed modified declined]
end
