@favorite.each do |favorite|
    json.set! favorite.product.id do
        json.id favorite.product.id
        json.name favorite.product.name
        json.brand favorite.product.brand
        json.style favorite.product.style
        json.price favorite.product.price
        json.image favorite.product.image
    end
end
