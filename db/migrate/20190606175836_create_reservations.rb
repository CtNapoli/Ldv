class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.datetime :date
      t.integer :guests
      t.integer :accepted
      t.timestamps
    end
  end
end
