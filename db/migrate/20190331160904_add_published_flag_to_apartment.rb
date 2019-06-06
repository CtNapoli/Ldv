class AddPublishedFlagToApartment < ActiveRecord::Migration[5.2]
  def change
    add_column :apartments, :published, :boolean, default: true
  end
end
