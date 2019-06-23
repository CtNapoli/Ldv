class AddUserInfoToReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :name, :string
    add_column :reservations, :email, :string
    add_column :reservations, :phone_number, :string
    add_column :reservations, :more_info, :text
  end
end
