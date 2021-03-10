class AddFieldToPrices < ActiveRecord::Migration[5.2]
  def change
    add_column :prices, :price_offer_start, :date
    add_column :prices, :price_offer_end, :date
    add_column :prices, :price_offer_value, :float
  end
end
