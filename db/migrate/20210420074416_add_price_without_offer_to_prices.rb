class AddPriceWithoutOfferToPrices < ActiveRecord::Migration[5.2]
  def change
    add_column :prices, :price_without_offer, :float
  end
end
