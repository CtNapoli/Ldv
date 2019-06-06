class RemoveNullConstraintsFromAreaTranslations < ActiveRecord::Migration[5.2]
  def change
    change_column_null :area_translations, :name, true
  end
end
