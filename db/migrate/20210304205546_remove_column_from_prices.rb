class RemoveColumnFromPrices < ActiveRecord::Migration[5.2]
  def change
    remove_column :prices, :special_offer_start
    remove_column :prices, :special_offer_end
    remove_column :prices, :special_offer_value
    remove_column :prices, :special_offer
  end
end
