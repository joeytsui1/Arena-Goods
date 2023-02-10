@products.each do |product|
    json.set! product.id do
        json.id product.id
        json.name product.name
        json.brand product.brand
        json.image product.image
        json.style product.style
        # json.images product.images
    end
end