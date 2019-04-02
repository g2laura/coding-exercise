class ChangeOfferSeasonToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :offers, :season, :integer
  end
end
