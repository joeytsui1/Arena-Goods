class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.references :user, foreign_key: {to: :user}
      t.references :product, foreign_key: {to: :product}
      t.integer :quantity, null: false, default: 1
      t.float :size
      t.timestamps
    end
  end
end
