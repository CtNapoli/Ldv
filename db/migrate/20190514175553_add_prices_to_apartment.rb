class AddPricesToApartment < ActiveRecord::Migration[5.2]
  def change
    add_reference :prices, :apartment, index: true
  end
end
