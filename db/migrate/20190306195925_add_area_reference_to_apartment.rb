class AddAreaReferenceToApartment < ActiveRecord::Migration[5.2]
  def change
    add_reference :apartments, :area, index: true
  end
end
