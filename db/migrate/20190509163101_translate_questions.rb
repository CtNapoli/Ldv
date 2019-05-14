class TranslateQuestions < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        Question.create_translation_table!({
          :request => :string,
          :reply => :string
        }, {
          :migrate_data => true
        })
      end

      dir.down do
        Question.drop_translation_table! :migrate_data => true
      end
    end
  end
end
