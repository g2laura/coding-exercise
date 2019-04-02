class Trade < ApplicationRecord
  belongs_to :bid
  belongs_to :offer

  def quantity
    self.bid.quantity
  end

  def price
    self.bid.price
  end

  class << self
    def is_valid?(offer, bid)
      is_price_valid?(offer, bid) && are_season_and_grade_valid?(offer, bid) && is_quantity_valid?(offer, bid)
    end

    def is_price_valid?(offer, bid)
      (bid.price >= offer.price) ? true : false
    end

    def are_season_and_grade_valid?(offer, bid)
      (offer.season == bid.season && offer.grade == bid.grade) ? true : false
    end

    def is_quantity_valid?(offer, bid)
      (bid.quantity >= offer.quantity) ? true : false
    end
  end
end
