class Bid < ApplicationRecord
  validates :quantity, numericality: { greater_than: 0 }
  validates :price, numericality: { greater_than: 0 }

  class << self
    def find_match(offer)
      bid = Bid.where(price: offer.price).first
      unless bid
        max_price = Bid.maximum(:price)
        if offer.price < max_price
          bid = Bid.where(price: max_price).first
        end
      end
      bid
    end
  end
end
