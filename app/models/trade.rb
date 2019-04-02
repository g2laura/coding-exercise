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
    valid_trade = (bid.price >= offer.price) ? true : false
    if valid_trade
      valid_trade = (offer.season == bid.season && offer.grade == bid.grade) ? true : false
    end
    valid_trade
  end
end
