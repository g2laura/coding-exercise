FactoryGirl.define do
  factory :trade do
    offer { FactoryGirl.create(:offer) }
    bid { FactoryGirl.create(:bid) }
  end
end
