class UpdateCart < ActiveRecord::Migration[7.0]
  def change
    change_column :carts, :size, :float, null: false
  end
end
