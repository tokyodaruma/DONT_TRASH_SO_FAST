class Surplus < ApplicationRecord
  belongs_to :user

  validates :category, :description, :location, :quantity, presence: true
end
