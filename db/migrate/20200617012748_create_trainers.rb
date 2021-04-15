class CreateTrainers < ActiveRecord::Migration[5.2]
  def change
    create_table :trainers do |t|
      t.string :name, null: false, unique: true 
      t.integer :age
      t.integer :sex
      t.string :number
      t.string :email, null: false, unique: true
      t.string :title
      t.text :content
      t.integer :price
      t.string :image

      t.timestamps
    end
  end
end
