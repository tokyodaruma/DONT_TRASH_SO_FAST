class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :surplus

  enum status: %i[pending accepted rejected]
  validates :status, inclusion: { in: statuses.keys }
  validates :status, presence: true
end
