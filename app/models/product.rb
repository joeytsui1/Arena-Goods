# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  style       :string           not null
#  brand       :string           not null
#  sku         :string           not null
#  description :text
#  size        :integer          not null
#  price       :integer          not null
#  quantity    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#
class Product < ApplicationRecord
    validates :name, :style, :brand, :sku, :size, :price, :quantity, presence: true
end
