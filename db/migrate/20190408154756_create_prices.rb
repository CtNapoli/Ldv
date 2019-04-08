class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.date :start
      t.date :end
      t.float :value
      t.timestamps
    end
  end
end
