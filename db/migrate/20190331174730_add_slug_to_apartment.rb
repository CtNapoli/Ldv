class AddSlugToApartment < ActiveRecord::Migration[5.2]
  def change
    add_column :apartments, :slug, :string
    add_index :apartments, :slug, unique: true
  end
end
