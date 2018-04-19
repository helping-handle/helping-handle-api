class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :goal
  enum status: [ :created, :confirmed, :modified, :declined ]
end