class AddContentToArea < ActiveRecord::Migration[5.2]
  def change
    add_column :areas, :content, :text
  end
end
