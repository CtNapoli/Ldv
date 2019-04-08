class AddContentToApartment < ActiveRecord::Migration[5.2]
  def change
    add_column :apartments, :content, :text
  end
end
