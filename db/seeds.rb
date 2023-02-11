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

  product1 = Product.create!(
    name: "Travis Scott x Fragment",
    style: "AIR JORDAN 1 HIGH OG",
    brand: "JORDAN",
    sku: "DH3227 105",
    description:
    "The Travis Scott x Fragment x Air Jordan 1 High OG “Military Blue” is a three way collaboration between the Houston rapper, the Japanese streetwear outfit, and Jordan Brand on Michael Jordan’s first signature shoe. Released alongside an Air Jordan 1 Low, the Travis Scott and Hiroshi Fujiwara-designed high-top Jordan 1 “Military Blue” combines the distinct aesthetics of both Scott and Fujiwara on the iconic retro basketball shoe. Supple Military Blue leather appears on the perforated toe and on the collar and heel. Contrasting white tumbled leather is located on the toe cap, forefoot, eyelets, and mid-panel. The oversized backwards black leather Swoosh is a call back to the styling of the hip-hop star’s first Air Jordan 1 collaboration from 2019. A black “Wings” logo resides on the collar. Industrial-style branding, as seen on fragment’s collaborations with Nike and Jordan Brand in the past, appears in black text on the medial side of the cream rubber midsole. Dual “Cactus Jack” and Fragment insignia can be found on the back of the left and right shoe, respectively. The Travis Scott x Fragment x Air Jordan 1 High OG “Military Blue” is one of the most desirable sneaker releases of 2021. Release date: July 29, 2021",
    price: 3410,
    gender: "Mens",
    released_date: "July 29, 2021",
    image: "https://img.stadiumgoods.com/17/03/61/57/17036157_43024052_2048.jpg"
  )

# product1_image = URI.open('https://arena-goods-seeds.s3.us-east-1.amazonaws.com/17036157_43024052_2048.webp?response-content-disposition=inline&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECYaCXVzLWVhc3QtMSJHMEUCIF8lyGfNE3uJfKmzrTW6Cz07RinwF8%2Bpx%2Fueq%2BVtdJ1hAiEA%2BFJgiBFIqIu5wYsmAioPSQEciYOcJ8JwoypWxoFCl2Aq7QIIrv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwwODA2NDM5MTYyMzciDKwhzwyb4NDCctYNvSrBAiGa%2BYDiJ7bgLruY31WV4fgQChaPXoPKTe2DGkgE6o4B6FLwnEaGhgK%2F%2Bn72PiK5Xx3BZrxLDDUBsnJbhURlUYbHfgYQW%2BqC3ubM9Uc%2BGigchJvXRs%2Fuu2mlb0gisses5DdAYwY%2Fo6dvmNBL%2F%2B4rYMzaJXOy7n%2B56cpNntLyAX04kpQ1efXeFZbFnPc9x2IdwvKQbquk6FbkrwhV7EyV0qNK5rjU6KNU3qt9YYUiNZH02kGPNE1S0zLgRvXoGZvlNGuSUsiRjuGtg1kJ3w3nZT5j0zMnAcWGIcAT%2FB8kIp4F1%2F8On1Sl0eJoS1APjivQU43J5rpbY9SZ0T5EFcXpWs%2BjxtpK%2BY9KRW7H8DA8EeFWBBG3Mih37rmtjyRdN7a%2BYM1B2mS8HwxT3phhMoQvxSztzNBwcFt%2BmKlbHielauOPezDbz5qfBjqzArj%2FMdXXQBqV0%2BDQmI9y92LJqt8uQw%2BnTeilLd8Yia7iLH78g89qJ28bUZa5GYcSq59nWXpG5wfkIZOJEHHaYEjg3CKupi0jseY6N%2BJOxj0lrP3JeOtyYWE%2BzXt0XFZGI9Aq8hsu3SObPcOEvRyf%2FuXdc5TQW4QB0EuBFqNQgZy5HI%2FvU5K8Z4TGZI1iMFcv9VZqk9DDXxd68xItJFcTsg9dx7YHiiPsLOnzZqySlwlRtmXVGnRQmPYZhmAfIFO93klgQZsxf2xsBooSO3Rayjfp3LHTkLBxrgiMFHiq08eXk4mJiTNf9tnWBZwxocnJ343MiSmZjacAF2I0bFPSCloo97P7VfSZtVCcTDyvNydIL50I7JNpEsHQjOl62bqMCoOAlE7buQSF4gmaDSCqCphhSEo%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230210T212629Z&X-Amz-SignedHeaders=host&X-Amz-Expires=300&X-Amz-Credential=ASIARFRWAQHGYR6QZ2ER%2F20230210%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=ef64e7a85df1312973074b776196742a5d10571beeea6dbb92ef2c9fc72db862')
# product1_image = URI.open('aws url')
# product1_image = URI.open('aws url')
# product1_image = URI.open('aws url')
# product1_image = URI.open('aws url')
# product1.attach(product1_image)
# product1.attach(product1_image)
# product1.attach(product1_image)
# product1.attach(product1_image)
# product1.attach(product1_image)


  # Product.create!(
  #   name: "Dior",
  #   style: "AIR JORDAN 1 HIGH OG",
  #   brand: "JORDAN",
  #   sku: "CN8607 002",
  #   description: "The Dior x Air Jordan 1 High is arguably the most desirable sneaker collaboration of 2020. Produced in Italy in extremely limited quantities, Dior’s first ever collaboration with Jordan Brand featured a multilayered release rollout that only stoked demand for one of the most sought after Jordan 1s in recent history. Employing a minimal appearance that parallels the original “White/Grey” Jordan 1 from 1985, the Dior variation features supple Dior grey leather overlays on the forefoot, eyelets, collar, and heel. White leather dots the mid-panel and perforated toe. An embroidered monogram Swoosh appears on either side and an “Air Dior” Wings logo can be found on the collar. A white rubber midsole and icy blue translucent outsole tie together the look of the understated Dior x Air Jordan 1. The Dior x Air Jordan 1 High was released on June 25, 2020.",
  #   price: 10499,
  #   gender: "Mens",
  #   released_date: "June 25, 2020",
  #   image: "https://img.stadiumgoods.com/15/62/45/04/15624504_43103426_2048.jpg"
  # )

  # Product.create!(
  #   name: "True Blue",
  #   style: "AIR JORDAN 1 HIGH OG",
  #   brand: "JORDAN",
  #   sku: "CN8607 002",
  #   description: "The Air Jordan 1 High OG “True Blue” is a colorway of the classic high-top sneaker that draws favorably from an original Air Jordan colorway. The shoe in question is the Air Jordan 3’s original “True Blue” colorway that debuted in 1988. While the shoes share a nickname, they differ from each other in design.",
  #   price: 200,
  #   gender: "Mens",
  #   released_date: "January 14, 2023",
  #   image: "https://img.stadiumgoods.com/19/51/74/53/19517453_43461021_2048.jpg",
  # )

  # Product.create!(
  #   name: "Off-White - Chicago",
  #   style: "AIR JORDAN 1",
  #   brand: "JORDAN",
  #   sku: "AA3834 101",
  #   description: "The verdict is in: The OFF-WHITE x Air Jordan 1 by Virgil Abloh is the sneaker of the year for 2017. The shoe absolutely everybody wants but few can get, the sneaker world has not seen a force like the Virgil Abloh Air Jordan 1 from “THE TEN” collection in a long time, if ever. Based off the original “Chicago” Air Jordan 1, the shoe features details that coincide with the rest of the ten models by Abloh like exposed foam, stitched on Swooshes, and the signature red zip tie. Sure to go down as one of the most hyped and coveted sneakers of all time, grab your piece of sneaker history now before they’re all gone.",
  #   price: 7875,
  #   gender: "Mens",
  #   released_date: "September 1, 2017",
  #   image: "https://img.stadiumgoods.com/12/95/99/19/12959919_43160183_2048.jpg"
  # )

  # Product.create!(
  #   name: "Chicago Lost and Found",
  #   style: "AIR JORDAN 1 RETRO HIGH OG",
  #   brand: "JORDAN",
  #   sku: "DZ5485 612",
  #   description: "The Air Jordan 1 High “Lost and Found” is the highly anticipated re-release of the original colorway of Michael Jordan’s signature shoe that draws inspiration from the model’s 1985 release. The “Lost and Found” replicates the look and feel of the debut version of the “Chicago” from the ‘80s.",
  #   price: 420,
  #   gender: "Mens",
  #   released_date: "November 19, 2022",
  #   image: "https://img.stadiumgoods.com/18/31/64/89/18316489_43163993_2048.jpg"
  # )

  # Product.create!(
  #   name: "Bred Toes",
  #   style: "JORDAN 1 RETRO HIGH",
  #   brand: "JORDAN",
  #   sku: "555088 610",
  #   description: "The adidas Yeezy Boost 350 “Turtledove” is the debut colorway of the modern classic, game-changing silhouette by Kanye West. The inaugural colorway features a Primeknit upper in black and cream white tones with a white rubber midsole that wraps around full-length Boost foam cushioning. The heel tab includes a red stripe to complete the clean look. Released in 2015 in very limited quantities, the 350 Boost “Turtledove” has become one of the rarest and most valuable models of the world famous and highly coveted sneaker line by West and adidas.",
  #   price: 499,
  #   gender: "Mens",
  #   released_date: "February 23, 2018",
  #   image: "https://img.stadiumgoods.com/13/15/75/30/13157530_43154839_2048.jpg"
  # )

  # Product.create!(
  #   name: "Banned / Bred",
  #   style: "AIR JORDAN 1 RETRO HIGH OG",
  #   brand: "JORDAN",
  #   sku: "555088 001",
  #   description: "The Air Jordan 1 High in the iconic black and red colorway returned once again in 2016 as part of the “Banned” campaign celebrating the history of the shoe. The legendary silhouette is presented in its OG iteration featuring an accurate shape and materials to compare to its original release. Simply put, the Air Jordan 1 Bred is an essential piece of any sneaker collection.",
  #   price: 539,
  #   gender: "Mens",
  #   released_date: "September 3, 2016",
  #   image: "https://img.stadiumgoods.com/11/70/77/94/11707794_42958046_2048.jpg",
  # )


  # Product.create!(
  #   name: "Turtle Dove",
  #   style: "YEEZY BOOST 350",
  #   brand: "ADIDAS YEEZY",
  #   sku: "AQ4832",
  #   description: "The adidas Yeezy Boost 350 “Turtledove” is the debut colorway of the modern classic, game-changing silhouette by Kanye West. The inaugural colorway features a Primeknit upper in black and cream white tones with a white rubber midsole that wraps around full-length Boost foam cushioning. The heel tab includes a red stripe to complete the clean look. Released in 2015 in very limited quantities, the 350 Boost “Turtledove” has become one of the rarest and most valuable models of the world famous and highly coveted sneaker line by West and adidas.",
  #   price: 359,
  #   gender: "Mens",
  #   released_date: "June 27, 2015",
  #   image: "https://img.stadiumgoods.com/12/96/37/19/12963719_42945637_2048.jpg"
  # )

  # Product.create!(
  #   name: "Kith Salmon Toe",
  #   style: "GEL-LYTE 5",
  #   brand: "ASICS",
  #   sku: "1201A542 700",
  #   description: "The Kith x Asics Gel-Lyte 5 “Salmon Toe” is a collaboration between Ronnie Fieg’s sneaker boutique and Asics that celebrates the former’s 10-year anniversary. The Kith x Asics Gel-Lyte 5 “Salmon Toe” is inspired by Kith and Asics’ Gel-Lyte 3 of the same nickname that was originally released in the early 2010s. The modern “Salmon Toe” features the same color block as its predecessor. Specifically, the perforated toe and forefoot overlays are designed in pink pigskin suede. The rest of the upper, including the eyelets, mid-panel, heel, and overlays, appear in navy pigskin suede. The white synthetic leather side stripes are accented with pink. A special “KXTH” logo denoting the shop’s anniversary appears on the heel while mismatched Asics and Fieg branding can be found on the left and right tongue, respectively. The shoe rides on a white foam midsole with Asics’ GEL cushioning technology in the heel.",
  #   price: 115,
  #   gender: "Mens",
  #   released_date: "November 26, 2021",
  #   image: "https://img.stadiumgoods.com/17/84/10/01/17841001_43084405_2048.jpg"
  # )

  puts "Done!"
end
