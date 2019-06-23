class AddReservationAcceptedDefault < ActiveRecord::Migration[5.2]
  def change
    change_column :reservations, :accepted, :integer, default: 0
  end
end
