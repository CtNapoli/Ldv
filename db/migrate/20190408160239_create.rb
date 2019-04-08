class Create < ActiveRecord::Migration[5.2]
  def change
    create_table :apartments_prices do |t|
      t.belongs_to :apartment, index: true
      t.belongs_to :price, index: true
    end
  end
end
