class Surplus < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_by_name_and_location_and_quantity,
                  against: %i[name location quantity],
                  using: {
                    tsearch: { prefix: true }
                  }
  belongs_to :user
  has_one_attached :photo
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  validates :category, :description, :quantity, :name, :location, presence: true
  validates :quantity, numericality: { only_integer: true }, inclusion: { in: 1..200, allow_nil: false }
  enum category: %i[bakery restaurant individual ngo butcher]
  validates :category, inclusion: { in: categories.keys }
end
