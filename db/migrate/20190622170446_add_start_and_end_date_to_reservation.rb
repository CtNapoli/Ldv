class AddStartAndEndDateToReservation < ActiveRecord::Migration[5.2]
  def change
    remove_column :reservations, :date, :datetime
    add_column :reservations, :date_start, :datetime
    add_column :reservations, :date_end, :datetime
  end
end
