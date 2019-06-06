class CreateOwnerRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :owner_requests do |t|
      t.string :name
      t.string :city
      t.string :email
      t.string :phone_number
      t.text :message
      t.timestamps
    end
  end
end
