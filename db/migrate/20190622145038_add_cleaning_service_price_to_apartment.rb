class AddCleaningServicePriceToApartment < ActiveRecord::Migration[5.2]
  def change
    add_column :apartments, :price_cleaning_service, :float
  end
end
