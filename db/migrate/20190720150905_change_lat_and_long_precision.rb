class ChangeLatAndLongPrecision < ActiveRecord::Migration[5.2]
  def change
    change_column :apartments, :lat, :float, precision: 6
    change_column :apartments, :lng, :float, precision: 6
  end
end
