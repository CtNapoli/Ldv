class AddDescriptionToArea < ActiveRecord::Migration[5.2]
  def change
    add_column :areas, :description, :string
  end
end
