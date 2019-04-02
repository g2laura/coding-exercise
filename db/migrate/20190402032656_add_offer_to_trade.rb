class AddOfferToTrade < ActiveRecord::Migration[5.2]
  def change
    add_reference :trades, :offer, foreign_key: true
  end
end
