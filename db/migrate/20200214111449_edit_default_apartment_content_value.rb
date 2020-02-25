class EditDefaultApartmentContentValue < ActiveRecord::Migration[5.2]
  def change
    change_column :apartments, :content, :text, default: '[]'
  end
end
