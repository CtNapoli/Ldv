class CreateApartments < ActiveRecord::Migration[5.2]
  def change
    create_table :apartments do |t|
      t.string :name
      t.string :address
      t.string :postal_code
      t.string :city
      t.string :province
      t.float :lat
      t.float :lng
      t.integer :capacity
      t.integer :square_meters
      t.integer :rooms
      t.integer :bedrooms
      t.integer :toilette
      t.integer :in_evidence
      t.timestamps
    end
  end
end
