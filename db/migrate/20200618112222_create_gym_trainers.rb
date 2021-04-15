class CreateGymTrainers < ActiveRecord::Migration[5.2]
  def change
    create_table :gym_trainers do |t|
      t.references :gym, index: true, foreign_key: true
      t.references :trainer, index: true, foreign_key: true

      t.timestamps
    end
  end
end
