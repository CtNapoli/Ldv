class AddPriceSellingToApartments < ActiveRecord::Migration[5.2]
  def change
    add_column :apartments, :price_selling, :float
  end
end
