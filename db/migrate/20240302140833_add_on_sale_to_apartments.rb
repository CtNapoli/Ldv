class AddOnSaleToApartments < ActiveRecord::Migration[5.2]
  def change
    add_column :apartments, :on_sale, :boolean
  end
end
