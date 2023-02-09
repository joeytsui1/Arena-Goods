class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false, index: true
      t.string :style, null: false, index: true
      t.string :brand, null: false, index: true
      t.string :sku, null: false
      t.text :description
      t.integer :size, null: false
      t.integer :price, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
