class AddOnSellingToApartments < ActiveRecord::Migration[5.2]
  def change
    add_column :apartments, :on_selling, :boolean
  end
end
