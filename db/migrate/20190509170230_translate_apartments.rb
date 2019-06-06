class TranslateApartments < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        Apartment.create_translation_table!({
          :name => :string,
          :content => :text
        }, {
          :migrate_data => true
        })
      end

      dir.down do
        Apartment.drop_translation_table! :migrate_data => true
      end
    end
  end
end
