class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :request
      t.text :reply
      t.timestamps
    end
  end
end
