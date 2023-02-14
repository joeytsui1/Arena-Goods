# == Schema Information
#
# Table name: products
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  style         :string           not null
#  brand         :string           not null
#  sku           :string           not null
#  gender        :string           not null
#  released_date :string
#  description   :text
#  price         :integer          not null
#  image         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Product < ApplicationRecord
    validates :name, :style, :brand, :sku, :price, presence: true
    
    has_many :shopping_carts,
        foreign_key: :product_id,
        class_name: :ShoppingCart
    # has_many_attached :images
end
