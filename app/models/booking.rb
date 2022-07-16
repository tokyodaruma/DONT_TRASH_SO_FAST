class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :surplus

  enum status: %i[pending accepted rejected]
  validates :date, :status, presence: true
end
