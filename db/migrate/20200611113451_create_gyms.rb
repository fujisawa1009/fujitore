class CreateGyms < ActiveRecord::Migration[5.2]
  def change
    create_table :gyms do |t|
      t.string :name, null: false
      t.string :title
      t.text :content
      t.string :number
      t.string :address
      t.integer :price
      t.integer :district_id
      t.string :image
      t.timestamps
    end
  end
end
