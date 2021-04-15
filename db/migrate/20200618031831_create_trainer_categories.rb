class CreateTrainerCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :trainer_categories do |t|
      t.references :trainer, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps
    end
  end
end
