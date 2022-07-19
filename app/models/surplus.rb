class Surplus < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :category, :description, :location, :quantity, presence: true
end
