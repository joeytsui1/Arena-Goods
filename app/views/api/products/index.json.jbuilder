@products.each do |product|
    json.set! product.id do
        json.id product.id
        json.name product.name
        json.brand product.brand
        json.image product.image
        json.style product.style
        json.price product.price
        json.sku product.sku
        json.description product.description
        json.gender product.gender
        json.released_date product.released_date
        # json.images product.images
    end
end