class RemoveOnSaleFromApartments < ActiveRecord::Migration[5.2]
  def change
    remove_column :apartments, :on_sale, :boolean
  end
end
