class Bid < ApplicationRecord
  has_one :trade

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
      # Asuming that the trade will be created once the match is found
      if Trade.is_valid?(offer, bid)
        Trade.create(offer: offer, bid: bid)
      end
      # Asuming that the match will always return a bid
      bid
    end
  end
end
