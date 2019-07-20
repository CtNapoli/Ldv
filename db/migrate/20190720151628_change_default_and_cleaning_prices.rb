class ChangeDefaultAndCleaningPrices < ActiveRecord::Migration[5.2]
  def change
    change_column :apartments, :price_default, :float, precision: 2
    change_column :apartments, :price_cleaning_service, :float, precision: 2
  end
end
