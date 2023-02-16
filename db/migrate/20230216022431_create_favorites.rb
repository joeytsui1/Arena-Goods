class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: {to: :users}
      t.references :product, foreign_key: {to: :products}
    end
  end
end
