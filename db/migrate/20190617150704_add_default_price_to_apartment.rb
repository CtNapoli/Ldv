class AddDefaultPriceToApartment < ActiveRecord::Migration[5.2]
  def change
    add_column :apartments, :price_default, :float
  end
end
