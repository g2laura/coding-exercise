require 'rails_helper'

RSpec.describe Offer, type: :model do
  subject(:subject) { FactoryGirl.build(:offer, season: '2017', quantity: 120, price: 600, grade: 'APW1') }

  it do
    should validate_numericality_of(:quantity).is_less_than_or_equal_to(500)
  end

  it do
    should validate_numericality_of(:price).is_less_than_or_equal_to(1000)
  end

  it do
    should validate_numericality_of(:season).only_integer
  end
end
