class Surplus < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :category, :description, :location, :quantity, presence: true
  validates :category, numericality: { greater_than_or_equal_to: 1 }
  enum category: %i[bakery restaurant individual ngo butcher]
end
