# == Schema Information
#
# Table name: favorites
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  product_id :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Favorite < ApplicationRecord
    belongs_to :user,
        foreign_key: :user_id,
        class_name: :User

    belongs_to :product,
        foreign_key: :product_id,
        class_name: :Product
end
