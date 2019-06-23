class AddApartmentReferenceToReservation < ActiveRecord::Migration[5.2]
  def change
    add_reference :reservations, :apartment, index: true
  end
end
