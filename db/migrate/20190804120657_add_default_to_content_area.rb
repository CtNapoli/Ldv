class AddDefaultToContentArea < ActiveRecord::Migration[5.2]
  def change
    change_column :areas, :content, :text, default: '[]'
  end
end
