class CreateApartmentsServices < ActiveRecord::Migration[5.2]
  def change
    create_table :apartments_services do |t|
      t.belongs_to :apartment, index: true
      t.belongs_to :service, index: true
    end
  end
end
