# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do
  puts "Destroying tables..."
  # Unnecessary if using `rails db:seed:replant`
  User.destroy_all
  Product.destroy_all

  puts "Resetting primary keys..."
  # For easy testing, so that after seeding, the first `User` has `id` of 1
  ApplicationRecord.connection.reset_pk_sequence!("users")
  ApplicationRecord.connection.reset_pk_sequence!("products")

  puts "Creating users..."
  # Create one user with an easy to remember username, email, and password:
  User.create!(
    first: "Demo",
    last: "Lition",
    email: "demo@user.io",
    password: "password",
  )
  puts "Creating products..."
  Product.create!(
    name: "Travis Scott x Fragment",
    style: "AIR JORDAN 1 HIGH OG SP",
    brand: "JORDAN",
    sku: "DH3227 105",
    description:
    "The Travis Scott x Fragment x Air Jordan 1 High OG “Military Blue” is a three way collaboration between the Houston rapper, the Japanese streetwear outfit, and Jordan Brand on Michael Jordan’s first signature shoe. Released alongside an Air Jordan 1 Low, the Travis Scott and Hiroshi Fujiwara-designed high-top Jordan 1 “Military Blue” combines the distinct aesthetics of both Scott and Fujiwara on the iconic retro basketball shoe. Supple Military Blue leather appears on the perforated toe and on the collar and heel. Contrasting white tumbled leather is located on the toe cap, forefoot, eyelets, and mid-panel. The oversized backwards black leather Swoosh is a call back to the styling of the hip-hop star’s first Air Jordan 1 collaboration from 2019. A black “Wings” logo resides on the collar. Industrial-style branding, as seen on fragment’s collaborations with Nike and Jordan Brand in the past, appears in black text on the medial side of the cream rubber midsole. Dual “Cactus Jack” and Fragment insignia can be found on the back of the left and right shoe, respectively. The Travis Scott x Fragment x Air Jordan 1 High OG “Military Blue” is one of the most desirable sneaker releases of 2021. Release date: July 29, 2021",
    size: 8,
    price: 3410,
    quantity: 10,
    image: "https://img.stadiumgoods.com/17/03/61/57/17036157_43024052_2048.jpg"
  )

  Product.create!(
  name: "Travis Scott x Fragment",
  style: "AIR JORDAN 1 HIGH OG SP",
  brand: "JORDAN",
  sku: "DH3227 105",
  description: "The Travis Scott x Fragment x Air Jordan 1 High OG “Military Blue” is a three way collaboration between the Houston rapper, the Japanese streetwear outfit, and Jordan Brand on Michael Jordan’s first signature shoe. Released alongside an Air Jordan 1 Low, the Travis Scott and Hiroshi Fujiwara-designed high-top Jordan 1 “Military Blue” combines the distinct aesthetics of both Scott and Fujiwara on the iconic retro basketball shoe. Supple Military Blue leather appears on the perforated toe and on the collar and heel. Contrasting white tumbled leather is located on the toe cap, forefoot, eyelets, and mid-panel. The oversized backwards black leather Swoosh is a call back to the styling of the hip-hop star’s first Air Jordan 1 collaboration from 2019. A black “Wings” logo resides on the collar. Industrial-style branding, as seen on fragment’s collaborations with Nike and Jordan Brand in the past, appears in black text on the medial side of the cream rubber midsole. Dual “Cactus Jack” and Fragment insignia can be found on the back of the left and right shoe, respectively. The Travis Scott x Fragment x Air Jordan 1 High OG “Military Blue” is one of the most desirable sneaker releases of 2021. Release date: July 29, 2021",
  size: 8.5,
  price: 3150,
  quantity: 10,
  image: "https://img.stadiumgoods.com/17/03/61/57/17036157_43024052_2048.jpg",
)

Product.create!(
  name: "Travis Scott x Fragment",
  style: "AIR JORDAN 1 HIGH OG SP",
  brand: "JORDAN",
  sku: "DH3227 105",
  description: "The Travis Scott x Fragment x Air Jordan 1 High OG “Military Blue” is a three way collaboration between the Houston rapper, the Japanese streetwear outfit, and Jordan Brand on Michael Jordan’s first signature shoe. Released alongside an Air Jordan 1 Low, the Travis Scott and Hiroshi Fujiwara-designed high-top Jordan 1 “Military Blue” combines the distinct aesthetics of both Scott and Fujiwara on the iconic retro basketball shoe. Supple Military Blue leather appears on the perforated toe and on the collar and heel. Contrasting white tumbled leather is located on the toe cap, forefoot, eyelets, and mid-panel. The oversized backwards black leather Swoosh is a call back to the styling of the hip-hop star’s first Air Jordan 1 collaboration from 2019. A black “Wings” logo resides on the collar. Industrial-style branding, as seen on fragment’s collaborations with Nike and Jordan Brand in the past, appears in black text on the medial side of the cream rubber midsole. Dual “Cactus Jack” and Fragment insignia can be found on the back of the left and right shoe, respectively. The Travis Scott x Fragment x Air Jordan 1 High OG “Military Blue” is one of the most desirable sneaker releases of 2021. Release date: July 29, 2021",
  size: 9,
  price: 3150,
  quantity: 10,
  image: "https://img.stadiumgoods.com/17/03/61/57/17036157_43024052_2048.jpg",
)

Product.create!(
  name: "Travis Scott x Fragment",
  style: "AIR JORDAN 1 HIGH OG SP",
  brand: "JORDAN",
  sku: "DH3227 105",
  description: "The Travis Scott x Fragment x Air Jordan 1 High OG “Military Blue” is a three way collaboration between the Houston rapper, the Japanese streetwear outfit, and Jordan Brand on Michael Jordan’s first signature shoe. Released alongside an Air Jordan 1 Low, the Travis Scott and Hiroshi Fujiwara-designed high-top Jordan 1 “Military Blue” combines the distinct aesthetics of both Scott and Fujiwara on the iconic retro basketball shoe. Supple Military Blue leather appears on the perforated toe and on the collar and heel. Contrasting white tumbled leather is located on the toe cap, forefoot, eyelets, and mid-panel. The oversized backwards black leather Swoosh is a call back to the styling of the hip-hop star’s first Air Jordan 1 collaboration from 2019. A black “Wings” logo resides on the collar. Industrial-style branding, as seen on fragment’s collaborations with Nike and Jordan Brand in the past, appears in black text on the medial side of the cream rubber midsole. Dual “Cactus Jack” and Fragment insignia can be found on the back of the left and right shoe, respectively. The Travis Scott x Fragment x Air Jordan 1 High OG “Military Blue” is one of the most desirable sneaker releases of 2021. Release date: July 29, 2021",
  size: 9.5,
  price: 3915,
  quantity: 10,
  image: "https://img.stadiumgoods.com/17/03/61/57/17036157_43024052_2048.jpg",
)

Product.create!(
  name: "Travis Scott x Fragment",
  style: "AIR JORDAN 1 HIGH OG SP",
  brand: "JORDAN",
  sku: "DH3227 105",
  description: "The Travis Scott x Fragment x Air Jordan 1 High OG “Military Blue” is a three way collaboration between the Houston rapper, the Japanese streetwear outfit, and Jordan Brand on Michael Jordan’s first signature shoe. Released alongside an Air Jordan 1 Low, the Travis Scott and Hiroshi Fujiwara-designed high-top Jordan 1 “Military Blue” combines the distinct aesthetics of both Scott and Fujiwara on the iconic retro basketball shoe. Supple Military Blue leather appears on the perforated toe and on the collar and heel. Contrasting white tumbled leather is located on the toe cap, forefoot, eyelets, and mid-panel. The oversized backwards black leather Swoosh is a call back to the styling of the hip-hop star’s first Air Jordan 1 collaboration from 2019. A black “Wings” logo resides on the collar. Industrial-style branding, as seen on fragment’s collaborations with Nike and Jordan Brand in the past, appears in black text on the medial side of the cream rubber midsole. Dual “Cactus Jack” and Fragment insignia can be found on the back of the left and right shoe, respectively. The Travis Scott x Fragment x Air Jordan 1 High OG “Military Blue” is one of the most desirable sneaker releases of 2021. Release date: July 29, 2021",
  size: 10,
  price: 3309,
  quantity: 10,
  image: "https://img.stadiumgoods.com/17/03/61/57/17036157_43024052_2048.jpg",
)

Product.create!(
  name: "Travis Scott x Fragment",
  style: "AIR JORDAN 1 HIGH OG SP",
  brand: "JORDAN",
  sku: "DH3227 105",
  description: "The Travis Scott x Fragment x Air Jordan 1 High OG “Military Blue” is a three way collaboration between the Houston rapper, the Japanese streetwear outfit, and Jordan Brand on Michael Jordan’s first signature shoe. Released alongside an Air Jordan 1 Low, the Travis Scott and Hiroshi Fujiwara-designed high-top Jordan 1 “Military Blue” combines the distinct aesthetics of both Scott and Fujiwara on the iconic retro basketball shoe. Supple Military Blue leather appears on the perforated toe and on the collar and heel. Contrasting white tumbled leather is located on the toe cap, forefoot, eyelets, and mid-panel. The oversized backwards black leather Swoosh is a call back to the styling of the hip-hop star’s first Air Jordan 1 collaboration from 2019. A black “Wings” logo resides on the collar. Industrial-style branding, as seen on fragment’s collaborations with Nike and Jordan Brand in the past, appears in black text on the medial side of the cream rubber midsole. Dual “Cactus Jack” and Fragment insignia can be found on the back of the left and right shoe, respectively. The Travis Scott x Fragment x Air Jordan 1 High OG “Military Blue” is one of the most desirable sneaker releases of 2021. Release date: July 29, 2021",
  size: 10.5,
  price: 3309,
  quantity: 10,
  image: "https://img.stadiumgoods.com/17/03/61/57/17036157_43024052_2048.jpg",
)

Product.create!(
  name: "Travis Scott x Fragment",
  style: "AIR JORDAN 1 HIGH OG SP",
  brand: "JORDAN",
  sku: "DH3227 105",
  description: "The Travis Scott x Fragment x Air Jordan 1 High OG “Military Blue” is a three way collaboration between the Houston rapper, the Japanese streetwear outfit, and Jordan Brand on Michael Jordan’s first signature shoe. Released alongside an Air Jordan 1 Low, the Travis Scott and Hiroshi Fujiwara-designed high-top Jordan 1 “Military Blue” combines the distinct aesthetics of both Scott and Fujiwara on the iconic retro basketball shoe. Supple Military Blue leather appears on the perforated toe and on the collar and heel. Contrasting white tumbled leather is located on the toe cap, forefoot, eyelets, and mid-panel. The oversized backwards black leather Swoosh is a call back to the styling of the hip-hop star’s first Air Jordan 1 collaboration from 2019. A black “Wings” logo resides on the collar. Industrial-style branding, as seen on fragment’s collaborations with Nike and Jordan Brand in the past, appears in black text on the medial side of the cream rubber midsole. Dual “Cactus Jack” and Fragment insignia can be found on the back of the left and right shoe, respectively. The Travis Scott x Fragment x Air Jordan 1 High OG “Military Blue” is one of the most desirable sneaker releases of 2021. Release date: July 29, 2021",
  size: 11,
  price: 3309,
  quantity: 10,
  image: "https://img.stadiumgoods.com/17/03/61/57/17036157_43024052_2048.jpg",
)
  Product.create!(
    name: "Dior",
    style: "AIR JORDAN 1 RETRO HIGH",
    brand: "JORDAN",
    sku: "CN8607 002",
    description: "The Dior x Air Jordan 1 High is arguably the most desirable sneaker collaboration of 2020. Produced in Italy in extremely limited quantities, Dior’s first ever collaboration with Jordan Brand featured a multilayered release rollout that only stoked demand for one of the most sought after Jordan 1s in recent history. Employing a minimal appearance that parallels the original “White/Grey” Jordan 1 from 1985, the Dior variation features supple Dior grey leather overlays on the forefoot, eyelets, collar, and heel. White leather dots the mid-panel and perforated toe. An embroidered monogram Swoosh appears on either side and an “Air Dior” Wings logo can be found on the collar. A white rubber midsole and icy blue translucent outsole tie together the look of the understated Dior x Air Jordan 1. The Dior x Air Jordan 1 High was released on June 25, 2020.",
    size: 8,
    price: 10499,
    quantity: 10,
    image: "https://img.stadiumgoods.com/15/62/45/04/15624504_43103426_2048.jpg"
  )

  Product.create!(
    name: "Turtle Dove",
    style: "YEEZY BOOST 350",
    brand: "ADIDAS YEEZY",
    sku: "AQ4832",
    description: "The adidas Yeezy Boost 350 “Turtledove” is the debut colorway of the modern classic, game-changing silhouette by Kanye West. The inaugural colorway features a Primeknit upper in black and cream white tones with a white rubber midsole that wraps around full-length Boost foam cushioning. The heel tab includes a red stripe to complete the clean look. Released in 2015 in very limited quantities, the 350 Boost “Turtledove” has become one of the rarest and most valuable models of the world famous and highly coveted sneaker line by West and adidas.",
    size: 8,
    price: 359,
    quantity: 10,
    image: "https://img.stadiumgoods.com/12/96/37/19/12963719_42945637_2048.jpg",
  )

  puts "Done!"
end
