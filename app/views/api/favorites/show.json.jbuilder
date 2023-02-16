@favorite.each do |favorite|
    json.set! favorite.product_id do
        json.id favorite.id
        json.name favorite.product.name
        json.product_id favorite.product.id
        json.brand favorite.product.brand
        json.style favorite.product.style
        json.price favorite.product.price
        json.image favorite.product.image
    end
end
