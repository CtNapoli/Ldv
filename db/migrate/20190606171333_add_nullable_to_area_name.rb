class AddNullableToAreaName < ActiveRecord::Migration[5.2]
  def change
    change_column :areas, :name, :string, null: true
  end
end
