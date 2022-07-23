class Surplus < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :category, :description, :location, :quantity, presence: true
  validates :quantity, numericality: { only_integer: true }, inclusion: { in: 0..10, allow_nil: false }
  enum category: %i[bakery restaurant individual ngo butcher]
  validates :category, inclusion: { in: categories.keys }
end
