class CreateTrainerDistricts < ActiveRecord::Migration[5.2]
  def change
    create_table :trainer_districts do |t|
      t.references :trainer, index: true, foreign_key: true
      t.references :district, index: true, foreign_key: true

      t.timestamps
    end
  end
end
