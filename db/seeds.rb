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

  puts "Done!"
end
