json.array! @cart do |eachCart|
  json.partial! "cart", cart: eachCart
  json.image eachCart.product.image
  json.name eachCart.product.name
  json.style eachCart.product.style
  json.image eachCart.product.image
  json.price eachCart.product.price
end