class ChangeAcceptedReservation < ActiveRecord::Migration[5.2]
  def change
    remove_column :reservations, :accepted, :integer
    add_column :reservations, :status, :integer, default: 50
  end
end
