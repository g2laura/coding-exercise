class Offer < ApplicationRecord
  has_one :trade

  validates :quantity, numericality: { greater_than: 0, less_than_or_equal_to: 500 }
  validates :price, numericality: { greater_than: 0, less_than_or_equal_to: 1000 }
  validates :season, numericality: { only_integer: true }
end
