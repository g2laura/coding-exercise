class Trade < ApplicationRecord
  belongs_to :bid
  belongs_to :offer

  def quantity
    self.bid.quantity
  end

  def price
    self.bid.price
  end

  def is_valid?(offer, bid)
    (bid.price >= offer.price) ? true : false
  end
end
