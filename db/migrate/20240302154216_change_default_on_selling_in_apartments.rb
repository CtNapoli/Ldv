class ChangeDefaultOnSellingInApartments < ActiveRecord::Migration[5.2]
  def change
    change_column_default :apartments, :on_selling, from: nil, to: false
  end
end
