class AddBidToTrade < ActiveRecord::Migration[5.2]
  def change
    add_reference :trades, :bid, foreign_key: true
  end
end
