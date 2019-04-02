require 'rails_helper'

RSpec.describe Trade, type: :model do
  it { should belong_to(:bid) }
  it { should belong_to(:offer) }

  let(:offer) { FactoryGirl.create(:offer, season: '2017', quantity: 120, price: 600, grade: 'APW1') }
  let(:bid) { FactoryGirl.create(:bid, season: '2017', quantity: 200, price: 800, grade: 'APW1') }
  subject(:subject) { FactoryGirl.create(:trade, offer: offer, bid: bid) }

  it 'references the bid quantity' do
    expect(subject.quantity).to eq(bid.quantity)
  end

  it 'references the bid price' do
    expect(subject.price).to eq(bid.price)
  end

  describe 'is_valid?' do
    it 'verifies if the bid price is higher than or equal to the offer' do
      expect(subject.is_valid?(offer, bid)).to be_truthy
    end

    it 'returns false if the offer price is higher than the bid' do
      bid = FactoryGirl.create(:bid, season: '2017', quantity: 200, price: 60, grade: 'APW1')
      expect(subject.is_valid?(offer, bid)).to be_falsy
    end

    it 'verifies if the offer and bid have a matching Season and Grade' do
      expect(subject.is_valid?(offer, bid)).to be_truthy
    end

    it 'returns false if the offer and bid have a different Season' do
      bid = FactoryGirl.create(:bid, season: '2019', quantity: 200, price: 60, grade: 'APW1')
      expect(subject.is_valid?(offer, bid)).to be_falsy
    end

    it 'returns false if the offer and bid have a different Grade' do
      bid = FactoryGirl.create(:bid, season: '2017', quantity: 200, price: 60, grade: 'H1')
      expect(subject.is_valid?(offer, bid)).to be_falsy
    end
  end
end
