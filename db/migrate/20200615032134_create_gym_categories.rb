class CreateGymCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :gym_categories do |t|
      t.references  :gym, index: true
      t.references  :category, index: true, foreign_key: true
      t.timestamps
    end
  end
end
