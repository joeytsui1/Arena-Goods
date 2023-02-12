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


  Product.create!(
    name: "Dior",
    style: "AIR JORDAN 1 HIGH OG",
    brand: "JORDAN",
    sku: "CN8607 002",
    description: "The Dior x Air Jordan 1 High is arguably the most desirable sneaker collaboration of 2020. Produced in Italy in extremely limited quantities, Dior’s first ever collaboration with Jordan Brand featured a multilayered release rollout that only stoked demand for one of the most sought after Jordan 1s in recent history. Employing a minimal appearance that parallels the original “White/Grey” Jordan 1 from 1985, the Dior variation features supple Dior grey leather overlays on the forefoot, eyelets, collar, and heel. White leather dots the mid-panel and perforated toe. An embroidered monogram Swoosh appears on either side and an “Air Dior” Wings logo can be found on the collar. A white rubber midsole and icy blue translucent outsole tie together the look of the understated Dior x Air Jordan 1. The Dior x Air Jordan 1 High was released on June 25, 2020.",
    price: 10499,
    gender: "Mens",
    released_date: "June 25, 2020",
    image: "https://img.stadiumgoods.com/15/62/45/04/15624504_43103426_2048.jpg"
  )

  Product.create!(
    name: "True Blue",
    style: "AIR JORDAN 1 HIGH OG",
    brand: "JORDAN",
    sku: "CN8607 002",
    description: "The Air Jordan 1 High OG “True Blue” is a colorway of the classic high-top sneaker that draws favorably from an original Air Jordan colorway. The shoe in question is the Air Jordan 3’s original “True Blue” colorway that debuted in 1988. While the shoes share a nickname, they differ from each other in design.",
    price: 200,
    gender: "Mens",
    released_date: "January 14, 2023",
    image: "https://img.stadiumgoods.com/19/51/74/53/19517453_43461021_2048.jpg",
  )

  Product.create!(
    name: "Off-White - Chicago",
    style: "AIR JORDAN 1",
    brand: "JORDAN",
    sku: "AA3834 101",
    description: "The verdict is in: The OFF-WHITE x Air Jordan 1 by Virgil Abloh is the sneaker of the year for 2017. The shoe absolutely everybody wants but few can get, the sneaker world has not seen a force like the Virgil Abloh Air Jordan 1 from “THE TEN” collection in a long time, if ever. Based off the original “Chicago” Air Jordan 1, the shoe features details that coincide with the rest of the ten models by Abloh like exposed foam, stitched on Swooshes, and the signature red zip tie. Sure to go down as one of the most hyped and coveted sneakers of all time, grab your piece of sneaker history now before they’re all gone.",
    price: 7875,
    gender: "Mens",
    released_date: "September 1, 2017",
    image: "https://img.stadiumgoods.com/12/95/99/19/12959919_43160183_2048.jpg"
  )

  Product.create!(
    name: "Chicago Lost and Found",
    style: "AIR JORDAN 1 RETRO HIGH OG",
    brand: "JORDAN",
    sku: "DZ5485 612",
    description: "The Air Jordan 1 High “Lost and Found” is the highly anticipated re-release of the original colorway of Michael Jordan’s signature shoe that draws inspiration from the model’s 1985 release. The “Lost and Found” replicates the look and feel of the debut version of the “Chicago” from the ‘80s.",
    price: 420,
    gender: "Mens",
    released_date: "November 19, 2022",
    image: "https://img.stadiumgoods.com/18/31/64/89/18316489_43163993_2048.jpg"
  )

  Product.create!(
    name: "Bred Toes",
    style: "JORDAN 1 RETRO HIGH",
    brand: "JORDAN",
    sku: "555088 610",
    description: "The adidas Yeezy Boost 350 “Turtledove” is the debut colorway of the modern classic, game-changing silhouette by Kanye West. The inaugural colorway features a Primeknit upper in black and cream white tones with a white rubber midsole that wraps around full-length Boost foam cushioning. The heel tab includes a red stripe to complete the clean look. Released in 2015 in very limited quantities, the 350 Boost “Turtledove” has become one of the rarest and most valuable models of the world famous and highly coveted sneaker line by West and adidas.",
    price: 499,
    gender: "Mens",
    released_date: "February 23, 2018",
    image: "https://img.stadiumgoods.com/13/15/75/30/13157530_43154839_2048.jpg"
  )

  Product.create!(
    name: "Banned / Bred",
    style: "AIR JORDAN 1 RETRO HIGH OG",
    brand: "JORDAN",
    sku: "555088 001",
    description: "The Air Jordan 1 High in the iconic black and red colorway returned once again in 2016 as part of the “Banned” campaign celebrating the history of the shoe. The legendary silhouette is presented in its OG iteration featuring an accurate shape and materials to compare to its original release. Simply put, the Air Jordan 1 Bred is an essential piece of any sneaker collection.",
    price: 539,
    gender: "Mens",
    released_date: "September 3, 2016",
    image: "https://img.stadiumgoods.com/11/70/77/94/11707794_42958046_2048.jpg",
  )

  Product.create!(
    name: "Off-White - Sail",
    style: "AIR JORDAN 4 RETRO SP WMNS",
    brand: "JORDAN",
    sku: "555088 001",
    description: "The women's Off-White x Air Jordan 4 “Sail” is a highly desirable collaboration between Virgil Abloh’s fashion label and Jordan Brand on Michael Jordan’s fourth signature shoe. Originating as a sample during Abloh’s “Figures of Speech” exhibit in Chicago’s Museum of Contemporary Art in Fall 2019, this clean colorway received an official retail release in Summer 2020 to much fanfare.",
    price: 1819,
    gender: "Womens",
    released_date: "July 25, 2020",
    image: "https://img.stadiumgoods.com/15/62/59/36/15625936_43111610_2048.jpg",
  )

Product.create!(
  name: "Travis Scott - Cactus Jack",
  style: "AIR JORDAN 4 RETRO",
  brand: "JORDAN",
  sku: "308497 406",
  description: "Following his popular Nike Air Force 1 collaboration with mix-and-match Swooshes, Travis Scott continued his reign as one of the sneaker world's hottest collaborators in 2018 with the Air Jordan 4 Cactus Jack. The bright blue nubuck construction with black and red accents takes inspiration from the team colors of the now defunct Houston Oilers football team, a reference to the rapper's Texas roots. Speckled detailing and Scott's Cactus Jack logo on the left heel tab add more personal touches to the shoe.",
  price: 1315,
  gender: "Mens",
  released_date: "June 9, 2018",
  image: "https://img.stadiumgoods.com/13/15/75/64/13157564_42986668_2048.jpg",
)

  Product.create!(
    name: "Kaws - Black",
    style: "AIR JORDAN 4 RETRO",
    brand: "JORDAN",
    sku: "930155 001",
    description: "If you thought the original grey KAWS x Air Jordan 4 was hard to get, it was nothing compared to this second colorway in black. The black KAWS Air Jordan 4 released in even more limited quantities, appearing first as a friends and family edition, then later releasing at retail only on the famous artist’s own webstore in November 2017 via a raffle system. If you took the L on the release like most of us, here’s your chance to finally score a pair of the elusive Air Jordan 4 by KAWS in black.",
    price: 2495,
    gender: "Mens",
    released_date: "November 27, 2017",
    image: "https://img.stadiumgoods.com/12/95/99/07/12959907_43153758_2048.jpg",
  )

Product.create!(
  name: "Kaws",
  style: "AIR JORDAN 4 RETRO",
  brand: "JORDAN",
  sku: "930155 003",
  description: "Famed artist KAWS has been rather reclusive since discontinuing his streetwear brand OriginalFake, only showing face for the occasional high art project or worthwhile collaboration. Jordan Brand commission him for the latter; his canvas: the Air Jordan 4. The result, magnificent. ",
  price: 3360,
  gender: "Mens",
  released_date: "March 31, 2017",
  image: "https://img.stadiumgoods.com/12/95/91/37/12959137_42962266_2048.jpg",
)

Product.create!(
  name: "Bred 2019",
  style: "AIR JORDAN 4 RETRO",
  brand: "JORDAN",
  sku: "308497 060",
  description: "This Air Jordan 4 “Bred” is the 2019 retro of the iconic colorway of Michael Jordan’s fourth signature shoe. The famous black and red version of the Jordan 4 returned in the spring of 2019 with its original “Nike Air” branding on the heel for the first time since its first retro release in 1999.",
  price: 460,
  gender: "Mens",
  released_date: "May 4, 2019",
  image: "https://img.stadiumgoods.com/14/07/65/19/14076519_43019802_2048.jpg",
)

Product.create!(
  name: "Lightning 2021",
  style: "AIR JORDAN 4 RETRO",
  brand: "JORDAN",
  sku: "CT8527 700",
  description: "The Air Jordan 4 “Lightning 2021” is a modern re-issue of the desirable colorway of Michael Jordan’s fourth signature shoe that was originally released in August 2006. Without question one of the most sought-after non-original Air Jordan shoes ever, the first “Lightning” was released in hyper-limited quantities exclusively on Jumpman23.com (the former Jordan Brand website) alongside a reverse black and yellow “Thunder” Jordan 4, together creating the “Thunder & Lightning” pack.",
  price: 325,
  gender: "Mens",
  released_date: "August 28, 2021",
  image: "https://img.stadiumgoods.com/17/24/03/54/17240354_43030229_2048.jpg",
)

Product.create!(
  name: "White Cement",
  style: "AIR JORDAN 4 RETRO",
  brand: "JORDAN",
  sku: "840606-192",
  description: "For the first time since 1999, the iconic Air Jordan 4 returned in true OG construction with the important re-introduction of “Nike Air” branding on the heel. In addition to the original branding, the Air Jordan 4 also received the remastered treatment with special attention to accurate construction details and shape. This release is an absolute must-have for any fan of the Air Jordan 4.",
  price: 755,
  gender: "Mens",
  released_date: "Febuary 13,2016",
  image: "https://img.stadiumgoods.com/12/95/99/12/12959912_42942730_2048.jpg",
)

Product.create!(
  name: "Cool Grey 2021",
  style: "AIR JORDAN 11 RETRO",
  brand: "JORDAN",
  sku: "CT8012 005",
  description: "The Air Jordan 11 “Cool Grey 2021” is the third-ever release of the popular, non-original colorway of Michael Jordan’s retro basketball shoe that originally debuted in 2001. The “Cool Grey” colorway of the Air Jordan 11 is considered one of the most storied and influential Air Jordan shoes ever, despite the fact that it’s not an original colorway of the silhouette. ",
  price: 330,
  gender: "Mens",
  released_date: "December 11, 2021",
  image: "https://img.stadiumgoods.com/17/56/54/19/17565419_43047718_2048.jpg",
)

Product.create!(
  name: "Bred 2019",
  style: "AIR JORDAN 11 RETRO",
  brand: "JORDAN",
  sku: "378037 061",
  description: "The Air Jordan 11 “Bred 2019” is the holiday 2019 release of the iconic sneaker in one of its most beloved original colorways. The classic black and red or “Bred” colorway, as worn by Michael Jordan during his run to the 1996 NBA Championship, returned once again in 2019 in pure form",
  price: 360,
  gender: "Mens",
  released_date: "December 14, 2019",
  image: "https://img.stadiumgoods.com/14/75/81/38/14758138_43099728_2048.jpg",
)

Product.create!(
  name: "Jubilee",
  style: "AIR JORDAN 11 RETRO",
  brand: "JORDAN",
  sku: "CT8012 011",
  description: "The Air Jordan 11 “Jubilee” honors the 25-year anniversary of Michael Jordan’s eleventh signature shoe by bringing to life an original design concept sketched by Tinker Hatfield in the ‘90s. The “Jubilee” borrows from the “Concord” and “Space Jam” colorways in that it features a predominately black and white appearance. ",
  price: 335,
  gender: "Mens",
  released_date: "December 12, 2020",
  image: "https://img.stadiumgoods.com/16/12/78/35/16127835_43094900_2048.jpg",
)

Product.create!(
  name: "Space Jam 2016",
  style: "AIR JORDAN 11 RETRO",
  brand: "JORDAN",
  sku: "378037 003",
  description: "The Jordan 11 remains one of the greatest sneakers ever produced. For proof look no further than the Air Jordan 11 Space Jam, which returned in 2016, this time modeled after the sample version Michael Jordan wore in 1995. Along with a new cut on the patent leather mudguard, differences include a Jumpman logo that faces the opposite direction and the no. 45 stitched into the heel.",
  price: 349,
  gender: "Mens",
  released_date: "December 10, 2016",
  image: "https://img.stadiumgoods.com/12/95/99/08/12959908_42955619_2048.jpg",
)

Product.create!(
  name: "Gamma",
  style: "AIR JORDAN 11 RETRO",
  brand: "JORDAN",
  sku: "378037 006",
  description: "Jordan Brand released this all-new colorway of the Air Jordan 11 in 2014 for the shoe’s annual holiday release. The stealthy all-black upper was complemented by hits of Gamme Blue and Varsity Maize to complete the modern take on the iconic silhouette.",
  price: 779,
  gender: "Mens",
  released_date: "December 21, 2013",
  image: "https://img.stadiumgoods.com/13/15/90/00/13159000_42938452_2048.jpg",
)

Product.create!(
  name: "Legend Blue",
  style: "AIR JORDAN 11 RETRO",
  brand: "JORDAN",
  sku: "378037 117",
  description: "Long awaited, the Air Jordan 11 Columbia returned in 2014 for the first time since 2001. The iconic original colorway of the Air Jordan 11 features an all-white upper with Jordan's Columbia Blue (renamed Legend Blue for the 2014 release) accents for the cleanest of all OG 11's.",
  price: 550,
  gender: "Mens",
  released_date: "December 20, 2014",
  image: "https://img.stadiumgoods.com/12/95/99/10/12959910_42945690_2048.jpg",
)

Product.create!(
  name: "Concepts - Orange Lobster Special Box",
  style: "SB DUNK LOW",
  brand: "NIKE",
  sku: "FD8776 800A",
  description: "The Concepts x Nike SB Dunk Low “Orange Lobster - Special Box” is a limited edition collaboration between the Boston based sneaker boutique and Nike SB on the skate shoe that continues its popular “Lobster” series. Introduced by Concepts and Nike SB in 2008, the “Lobster” collection is a nod to Concepts’ Boston area roots and its cuisine. ",
  price: 995,
  gender: "Mens",
  released_date: "December 2, 2022",
  image: "https://img.stadiumgoods.com/19/47/90/62/19479062_43259375_2048.jpg",
)

Product.create!(
  name: "Panda",
  style: "SB DUNK LOW",
  brand: "NIKE",
  sku: "DD1391 100",
  description: "The Nike Dunk Low “Black/White” is a timeless look for the ultra popular low-top shoe that was released in March 2021. The Dunk made an improbable comeback in 2020 to become one of the hottest shoes on the planet after spending several years in the vault.",
  price: 200,
  gender: "Mens",
  released_date: "March 10, 2021",
  image: "https://img.stadiumgoods.com/16/40/35/69/16403569_43123591_2048.jpg"
)

Product.create!(
  name: "Team Red",
  style: "SB DUNK LOW",
  brand: "NIKE",
  sku: "DD1391 601",
  description: "The Nike Dunk Low Team Red has been a footwear staple for over 35 years, but as of late, it's been one of the hottest models in sneaker culture. Originally created as a basketball shoe, the low-top, lace-up silhouette is now known as an off-duty pair for the streets. The casual Nike sneaker is outfitted with a laidback dark red and white color scheme on the premium leather upper—white covers the base, while red adds a bold touch on the overlay detailing. The Nike Dunk Low sneaker is finished with a white midsole and red outsole.",
  price: 205,
  gender: "Mens",
  released_date: "March 28, 2021",
  image: "https://img.stadiumgoods.com/18/17/44/53/18174453_43078667_2048.jpg",
)

Product.create!(
  name: "Two Tone Grey",
  style: "SB DUNK LOW",
  brand: "NIKE",
  sku: "DJ6188 001",
  description: "The Nike Dunk Low “Two-tone Grey” is a versatile, white-and-grey colorway of the casual lifestyle shoe that was released in March 2022. The base of the upper is designed in Pure Platinum leather while contrasting Wolf Grey leather appears on the overlays. A white leather Swoosh is found on either side of the shoe and white “Nike” branding is embroidered on the heel. The grey tongue tag features “Nike” and Swoosh detailing. A two-tone, white midsole and grey rubber outsole complete the design.",
  price: 289,
  gender: "Mens",
  released_date: "March 1, 2022",
  image: "https://img.stadiumgoods.com/18/43/71/81/18437181_43173565_2048.jpg",
)

Product.create!(
  name: "USA",
  style: "SB DUNK LOW",
  brand: "NIKE",
  sku: "DD1391 400",
  description: "The Nike Dunk Low “USA” is a May 2022 release of the patriotic sneaker in a classic colorway and all-leather construction. The “USA” celebrates major holidays that are observed by the US during the spring and summer. This design features Valerian Blue overlays that are contrasted with a white leather base on the mid-panel, toe, and heel. Blue Swooshes cover the mid-panels and pops of red appear on the tongue and heel logo to complete the design",
  price: 210,
  gender: "Mens",
  released_date: "June 16, 2022",
  image: "https://img.stadiumgoods.com/18/63/92/62/18639262_43161686_2048.jpg",
)

Product.create!(
  name: "Silver Bullet 2022",
  style: "AIR MAX 97 OG",
  brand: "NIKE",
  sku: "DM0028 002",
  description: "The Nike Air Max 97 “Silver Bullet 2022” is the modern reissue of the original colorway of the iconic retro running shoe that celebrated its 25th anniversary in 2022. Created by Nike footwear designer Christian Tresser in 1997, the Air Max 97 is considered one of the very best Air Max models in the collection’s history.",
  price: 149,
  gender: "Mens",
  released_date: "November 11, 2022",
  image: "https://img.stadiumgoods.com/19/30/31/04/19303104_43164850_2048.jpg",
)

Product.create!(
  name: "Off-White - White",
  style: "THE 10 : NIKE AIR MAX 97 OG",
  brand: "NIKE",
  sku: "AJ4585 100",
  description: "The OFF-WHITE x Nike “THE TEN” collection took the sneaker world by storm in 2017, resulting in one of the most hyped collaborations of all time. Among the favorite designs in Virgil’s ten iconic silhouettes from Nike, Air Jordan, and Converse history is this Air Max 97, which strips the original design down to a modern construction and appearance with all the signature details of the celebrated collection.",
  price: 3490,
  gender: "Mens",
  released_date: "September 1, 2017",
  image: "https://img.stadiumgoods.com/12/96/03/43/12960343_43151626_2048.jpg"
)

Product.create!(
  name: "Off-White - Black",
  style: "THE 10 : NIKE AIR MAX 97 OG",
  brand: "NIKE",
  sku: "AJ4585 001",
  description: "The Off-White x Nike Air Max 97 Black is a stealthy edition of the incredibly popular design by Virgil Abloh. Following his first remodel of the classic Air Max model that released within the monumental “The Ten” collection in 2017, this 2018 release basically reverses the original white colorway.",
  price: 2100,
  gender: "Mens",
  released_date: "October 18, 2018",
  image: "https://img.stadiumgoods.com/13/67/87/74/13678774_42976617_2048.jpg",
)

Product.create!(
  name: "Off-White - Queen",
  style: "THE 10 : NIKE AIR MAX 97 OG",
  brand: "NIKE",
  sku: "AJ4585 600",
  description: "The Serena Williams x Off-White x Nike Air Max 97 was designed by Virgil Abloh to celebrate the on-court dominance and memorable style of the tennis legend. Part of the “Queen” collection released around the 2018 US Open tennis tournament in New York City, the limited edition Air Max 97 for Williams features a light grey upper in the same construction as the original Off-White x Nike Air Max 97 from “The Ten” collection.",
  price: 1930,
  gender: "Mens",
  released_date: "August 27, 2018",
  image: "https://img.stadiumgoods.com/13/68/41/36/13684136_42975717_2048.jpg",
)

Product.create!(
  name: "Sean Wotherspoon",
  style: "AIR MAX 1/97 VF SW",
  brand: "NIKE",
  sku: "AJ4219 400",
  description: "Created by popular demand. Sean Wotherspoon’s winning Air Max sneaker design from the RevolutionAIR voting campaign in early 2017 is now a reality. His creation, the Air Max 1/97 VF SW, features a hybrid design of the Air Max 97 upper in a unique multi-colored corduroy build on top of the iconic tooling of the Air Max 1.",
  price: 1315,
  gender: "Mens",
  released_date: "November 21, 2017",
  image: "https://img.stadiumgoods.com/13/12/32/19/13123219_43153341_2048.jpg"
)

Product.create!(
  name: "White on White",
  style: "AIR FORCE 1 LOW '07",
  brand: "NIKE",
  sku: "CW2288 111",
  description: "The Nike Air Force 1 Low “White on White” is one of the most popular and best-selling sneakers of all time. An essential for any collection, the all-white Air Force 1 Low is a versatile design that can be worn with virtually anything. ",
  price: 100,
  gender: "Mens",
  released_date: "November 21, 1986",
  image: "https://img.stadiumgoods.com/16/35/26/08/16352608_43121321_2048.jpg",
)

Product.create!(
  name: "Virgil Abloh - White / Red",
  style: "LOUIS VUITTON AIR FORCE 1 LOW",
  brand: "NIKE",
  sku: "1A9VA9",
  description: "The Louis Vuitton x Nike Air Force 1 Low “White/Red” is a special collaboration between the storied high fashion house and Nike that was directed by the late Virgil Abloh. One of multiple colorways of the Air Force 1 produced by Louis Vuitton, Nike, and Abloh in 2022, the “White/Red” features a two-tone color block of white and red that mimics the designed of original Nike Dunk colorways from 1985.",
  price: 5400,
  gender: "Mens",
  released_date: "July 19, 2022",
  image: "https://img.stadiumgoods.com/18/76/90/26/18769026_43157492_2048.jpg",
)

Product.create!(
  name: "G-Dragon - White",
  style: "AIR FORCE 1 LOW",
  brand: "NIKE",
  sku: "DD3223 100",
  description: "The G-Dragon x Nike Air Force 1 Low “White” is the follow-up colorway to the South Korean pop artist’s collaboration with Nike on the iconic low-top silhouette. Released by Nike in Fall 2020, the white “Para Noise” colorway is the second Air Force 1 created under G-Dragon’s Peaceminusone fashion label featuring a tear-away design.",
  price: 260,
  gender: "Mens",
  released_date: "November 25, 2020",
  image: "https://img.stadiumgoods.com/15/81/95/51/15819551_43111801_2048.jpg",
)

Product.create!(
  name: "G-Dragon - Black",
  style: "AIR FORCE 1 LOW",
  brand: "NIKE",
  sku: "AQ3692 001",
  description: "The G-Dragon x Nike Air Force 1 Low Para-Noise is the Korean pop star’s interpretation of one of his favorite childhood shoes. The international superstar fondly recalls memories of wearing oversized clothes, hats and matching Air Force 1s once upon a time, and that sentiment serves as the inspiration behind this limited collaboration. ",
  price: 440,
  gender: "Mens",
  released_date: "November 25, 2019",
  image: "https://img.stadiumgoods.com/14/75/45/76/14754576_43084144_2048.jpg",
)

Product.create!(
  name: "Off-White Volt",
  style: "THE 10: NIKE AIR FORCE 1 LOW",
  brand: "NIKE",
  sku: "AQ3692 001",
  description: "The Off-White x Nike Air Force 1 Low “Volt” came out in December 2018 and added a blast of color to a year of releases from Virgil Abloh and the Swoosh. Releases alongside a black colorway in the same materials, this decidedly bolder edition features a Volt synthetic and mesh construction with matching suede for the eyestay paneling and heel tab.",
  price: 905,
  gender: "Mens",
  released_date: "December 19, 2018",
  image: "https://img.stadiumgoods.com/13/67/84/93/13678493_42981246_2048.jpg",
)
# AIR MAX 1s
Product.create!(
  name: "Patta - Noise Aqua",
  style: "AIR MAX 1",
  brand: "NIKE",
  sku: "DH1348 004",
  description: "The Patta x Nike Air Max 1 “Noise Aqua” is one of several colorways of the vintage running shoe designed by the Amsterdam-based sneaker boutique and Nike. The “Noise Aqua” reimagines the Air Max 1’s signature mudguard in a new wavy design for a fresh look. The upper features a white mesh base with tonal leather overlays.",
  price: 210,
  gender: "Mens",
  released_date: "October 29, 2021",
  image: "https://img.stadiumgoods.com/17/46/81/67/17468167_43055943_2048.jpg",
)

Product.create!(
  name: "Travis Scott - Wheat",
  style: "AIR MAX 1",
  brand: "NIKE",
  sku: "DO9392 701",
  description: "The Travis Scott x Nike Air Max 1 “Wheat” is one of several colorways of the retro running shoe designed by the hip-hop star. Once thought to be a Friends & Family exclusive colorway, the “Wheat” was given a proper retail release in May 2022. The colorway joins the “Baroque Brown” and “Saturn Gold” Air Max 1s by Travis in featuring a modified look with rugged, outdoors-inspired details.",
  price: 515,
  gender: "Mens",
  released_date: "May 23, 2022",
  image: "https://img.stadiumgoods.com/17/61/77/91/17617791_43156998_2048.jpg",
)

Product.create!(
  name: "Blueprint",
  style: "AIR MAX 1",
  brand: "NIKE",
  sku: "DO9392 701",
  description: "The Nike Air Max 1 “Blueprint” is a special, regional-exclusive release of the retro performance running shoe that was available in North America in March 2022. The “Blueprint” is one of three regional releases of the Air Max 1 that celebrates the legendary silhouette’s 35-year anniversary.",
  price: 189,
  gender: "Mens",
  released_date: "March 26, 2022",
  image: "https://img.stadiumgoods.com/18/21/84/60/18218460_43159418_2048.jpg",
)

Product.create!(
  name: "Atmos Elephant 2017",
  style: "AIR MAX 1 PREMIUM RETRO",
  brand: "NIKE",
  sku: "908366 001",
  description: "During Air Max Day 2016, Nike introduced the Vote Back campaign, which gave their loyal customer base a chance to vote for a classic Air Max model most worthy of a retro release. With the winner slated to release during Air Max Day 2017, it was announced that the iconic atmos x Nike Air Max 1 would make its triumphant return.",
  price: 1049,
  gender: "Mens",
  released_date: "March 18, 2017",
  image: "https://img.stadiumgoods.com/17/61/77/91/17617791_43156998_2048.jpg",
)
Product.create!(
  name: "Concepts - Mellow",
  style: "AIR MAX 1",
  brand: "NIKE",
  sku: "DN1803 300",
  description: "The Concepts x Nike Air Max 1 “Mellow” is a collaboration between the Boston based sneaker boutique and Nike on the vintage running shoe in a colorway inspired by 1960s and 1970s youth culture. The “Mellow” colorway draws favorably from the era’s music festivals, specifically the ‘69 Harlem Cultural Festival, which was headlined by the likes of Stevie Wonder, Nina Simone, and many more.",
  price: 169,
  gender: "Mens",
  released_date: "March 5, 2022",
  image: "https://img.stadiumgoods.com/18/17/21/01/18172101_43084897_2048.jpg",
)

# ADIDAS
Product.create!(
  name: "Turtle Dove",
  style: "YEEZY BOOST 350",
  brand: "ADIDAS",
  sku: "AQ4832",
  description: "The adidas Yeezy Boost 350 “Turtledove” is the debut colorway of the modern classic, game-changing silhouette by Kanye West. The inaugural colorway features a Primeknit upper in black and cream white tones with a white rubber midsole that wraps around full-length Boost foam cushioning. The heel tab includes a red stripe to complete the clean look. Released in 2015 in very limited quantities, the 350 Boost “Turtledove” has become one of the rarest and most valuable models of the world famous and highly coveted sneaker line by West and adidas.",
  price: 359,
  gender: "Mens",
  released_date: "June 27, 2015",
  image: "https://img.stadiumgoods.com/12/96/37/19/12963719_42945637_2048.jpg",
)

Product.create!(
  name: "Bone",
  style: "YEEZY BOOST 350 V2",
  brand: "ADIDAS",
  sku: "HQ6316",
  description: "The adidas Yeezy Boost 350 V2 Bone features a triple white Primeknit upper with mesh side stripes and canvas heel tabs. At the base, a semi-translucent sole with Boost technology completes the design.",
  price: 315,
  gender: "Mens",
  released_date: "March 11, 2022",
  image: "https://img.stadiumgoods.com/18/02/54/02/18025402_43164371_2048.jpg",
)

Product.create!(
  name: "Dazzling Blue",
  style: "YEEZY BOOST 350 V2",
  brand: "ADIDAS",
  sku: "GY7164",
  description: "The YEEZY BOOST 350 V2 features an upper composed of re-engineered Primeknit. The post-dyed monofilament side stripe is woven into the upper. Reflective threads are woven into the laces. The midsole utilizes adidas' innovative BOOST™ technology.",
  price: 330,
  gender: "Mens",
  released_date: "February 26, 2022",
  image: "https://img.stadiumgoods.com/17/80/93/87/17809387_43086670_2048.jpg",
)

Product.create!(
  name: "Bred",
  style: "YEEZY BOOST 350 V2",
  brand: "ADIDAS",
  sku: "CP9652",
  description: "The YEEZY BOOST 350 V2 features an upper composed of re-engineered Primeknit. The post-dyed monofilament side stripe is woven into the upper. Reflective threads are woven into the laces. The midsole utilizes adidas' innovative BOOST™ technology.",
  price: 340,
  gender: "Mens",
  released_date: "December 5, 2020",
  image: "https://img.stadiumgoods.com/11/93/64/44/11936444_42958064_2048.jpg",
)

Product.create!(
  name: "Zebra",
  style: "YEEZY BOOST 350 V2",
  brand: "ADIDAS",
  sku: "CP9654",
  description: "The YEEZY BOOST 350 V2 features an upper composed of re-engineered Primeknit. The post-dyed monofilament side stripe is woven into the upper. Reflective threads are woven into the laces. The midsole utilizes adidas' innovative BOOST™ technology.",
  price: 335,
  gender: "Mens",
  released_date: "April 9, 2022",
  image: "https://img.stadiumgoods.com/12/43/12/89/12431289_27476285_2048.jpg",
)

Product.create!(
  name: "Cored Red Black",
  style: "YEEZY BOOST 350 V2",
  brand: "ADIDAS",
  sku: "BY9612",
  description: "The YEEZY BOOST 350 V2 features an upper composed of re-engineered Primeknit. The post-dyed monofilament side stripe is woven into the upper. Reflective threads are woven into the laces. The midsole utilizes adidas' innovative BOOST™ technology.",
  price: 340,
  gender: "Mens",
  released_date: "November 23, 2016",
  image: "https://img.stadiumgoods.com/12/96/03/33/12960333_42951524_2048.jpg",
)

Product.create!(
  name: "Oreo",
  style: "YEEZY BOOST 350 V2",
  brand: "ADIDAS",
  sku: "BY1604",
  description: "The YEEZY BOOST 350 V2 features an upper composed of re-engineered Primeknit. The post-dyed monofilament side stripe is woven into the upper. Reflective threads are woven into the laces. The midsole utilizes adidas' innovative BOOST™ technology.",
  price: 420,
  gender: "Mens",
  released_date: "November 23, 2016",
  image: "https://img.stadiumgoods.com/12/96/03/30/12960330_42946195_2048.jpg"
)

Product.create!(
  name: "Blue Tint",
  style: "YEEZY BOOST 350 V2",
  brand: "ADIDAS",
  sku: "B37571",
  description: "The YEEZY BOOST 350 V2 features an upper composed of re-engineered Primeknit. The post-dyed monofilament side stripe is woven into the upper. Reflective threads are woven into the laces. The midsole utilizes adidas' innovative BOOST™ technology.",
  price: 289,
  gender: "Mens",
  released_date: "October 23, 2017",
  image: "https://img.stadiumgoods.com/12/54/18/16/12541816_43162409_2048.jpg",
)

Product.create!(
  name: "Mono Ice",
  style: "YEEZY BOOST 350 V2",
  brand: "ADIDAS",
  sku: "GW2869",
  description: "The YEEZY BOOST 350 V2 features an upper composed of re-engineered Primeknit. The post-dyed monofilament side stripe is woven into the upper. Reflective threads are woven into the laces. The midsole utilizes adidas' innovative BOOST™ technology.",
  price: 295,
  gender: "Mens",
  released_date: "June 18, 2021",
  image: "https://img.stadiumgoods.com/16/93/81/83/16938183_43025269_2048.jpg",
)
Product.create!(
  name: "Mono Clay",
  style: "YEEZY BOOST 350 V2",
  brand: "ADIDAS",
  sku: "GW2870",
  description: "The YEEZY BOOST 350 V2 features an upper composed of re-engineered Primeknit. The post-dyed monofilament side stripe is woven into the upper. Reflective threads are woven into the laces. The midsole utilizes adidas' innovative BOOST™ technology.",
  price: 195,
  gender: "Mens",
  released_date: "June 18, 2021",
  image: "https://img.stadiumgoods.com/17/00/38/13/17003813_43061769_2048.jpg",
)

Product.create!(
  name: "Mono Mist",
  style: "YEEZY BOOST 350 V2",
  brand: "ADIDAS",
  sku: "GW2871",
  description: "The YEEZY BOOST 350 V2 features an upper composed of re-engineered Primeknit. The post-dyed monofilament side stripe is woven into the upper. Reflective threads are woven into the laces. The midsole utilizes adidas' innovative BOOST™ technology.",
  price: 230,
  gender: "Mens",
  released_date: "June 18, 2021",
  image: "https://img.stadiumgoods.com/17/00/46/48/17004648_43023551_2048.jpg",
)

Product.create!(
  name: "Mono Cinder",
  style: "YEEZY BOOST 350 V2",
  brand: "ADIDAS",
  sku: "GX3791",
  description: "The YEEZY BOOST 350 V2 features an upper composed of re-engineered Primeknit. The post-dyed monofilament side stripe is woven into the upper. Reflective threads are woven into the laces. The midsole utilizes adidas' innovative BOOST™ technology.",
  price: 200,
  gender: "Mens",
  released_date: "June 18, 2021",
  image: "https://img.stadiumgoods.com/17/03/72/28/17037228_43024211_2048.jpg",
)

Product.create!(
  name: "Asriel/Carbon",
  style: "YEEZY BOOST 350 V2",
  brand: "ADIDAS",
  sku: "FZ5000",
  description: "The YEEZY BOOST 350 V2 features an upper composed of re-engineered Primeknit. The post-dyed monofilament side stripe is woven into the upper. Reflective threads are woven into the laces. The midsole utilizes adidas' innovative BOOST™ technology.",
  price: 230,
  gender: "Mens",
  released_date: "October 2, 2020",
  image: "https://img.stadiumgoods.com/15/81/76/36/15817636_43100519_2048.jpg",
)

Product.create!(
  name: "Zyon",
  style: "YEEZY BOOST 350 V2",
  brand: "ADIDAS",
  sku: "FZ5000",
  description: "The YEEZY BOOST 350 V2 features an upper composed of re-engineered Primeknit. The post-dyed monofilament side stripe is woven into the upper. Reflective threads are woven into the laces. The midsole utilizes adidas' innovative BOOST™ technology.",
  price: 275,
  gender: "Mens",
  released_date: "July 18, 2020",
  image: "https://img.stadiumgoods.com/15/42/75/51/15427551_43099823_2048.jpg",
)

Product.create!(
  name: "Beluga",
  style: "YEEZY BOOST 350 V2",
  brand: "ADIDAS",
  sku: "BB1826",
  description: "The YEEZY BOOST 350 V2 features an upper composed of re-engineered Primeknit. The post-dyed monofilament side stripe is woven into the upper. Reflective threads are woven into the laces. The midsole utilizes adidas' innovative BOOST™ technology.",
  price: 475,
  gender: "Mens",
  released_date: "November 25, 2017",
  image: "https://img.stadiumgoods.com/11/70/76/53/11707653_42942357_2048.jpg",
)

Product.create!(
  name: "Beluga",
  style: "YEEZY BOOST 350 V2 REFLECTIVE",
  brand: "ADIDAS",
  sku: "GW1229",
  description: "The YEEZY BOOST 350 V2 features an upper composed of re-engineered Primeknit. The post-dyed monofilament side stripe is woven into the upper. Reflective threads are woven into the laces. The midsole utilizes adidas' innovative BOOST™ technology.",
  price: 269,
  gender: "Mens",
  released_date: "December 18, 2021",
  image: "https://img.stadiumgoods.com/17/70/19/91/17701991_43071895_2048.jpg",
)

Product.create!(
  name: "Wave Runner",
  style: "YEEZY BOOST 700",
  brand: "ADIDAS",
  sku: "B75571",
  description: "Ride the wave! Adding another unique sneaker to his line Kanye West introduced the adidas Yeezy Boost 700 Wave Runner in 2017. A love-it-or-hate-it shoe for many, if you’re here on this page, we’re guessing you love its eye-catching look with a chunky sole and running inspired upper. ",
  price: 389,
  gender: "Mens",
  released_date: "November 1, 2017",
  image: "https://img.stadiumgoods.com/12/96/03/48/12960348_43173035_2048.jpg",
)

Product.create!(
  name: "Blush",
  style: "YEEZY 500",
  brand: "ADIDAS",
  sku: "DB2908",
  description: "Expanding his adidas Yeezy line even further, Kanye West presents the Yeezy 500 Desert Rat sneaker. The Desert Rat features a blend of retro and modern, with a chunky Feet You Wear sole unit from the adidas archives and a high-fashion influenced new design up top built in mesh and premium suede.",
  price: 315,
  gender: "Mens",
  released_date: "November 1, 2018",
  image: "https://img.stadiumgoods.com/13/15/75/85/13157585_43173361_2048.jpg",
)

Product.create!(
  name: "Pure",
  style: "YEEZY SLIDE",
  brand: "ADIDAS",
  sku: "GZ5554",
  description: "The adidas Yeezy Slide “Pure” is one of three earth tone colorways of the comfortable slip-on sandal to be released by Kanye West and adidas in April 2021. Releasing next to the “Core” and “Resin” styles, the “Pure” features a beige-colored lightweight EVA foam construction for maximum comfort whether walking through the city streets or relaxing poolside",
  price: 215,
  gender: "Mens",
  released_date: "April 26, 2021",
  image: "https://img.stadiumgoods.com/16/81/13/47/16811347_43052960_2048.jpg",
)

Product.create!(
  name: "Onyx",
  style: "YEEZY FOAM RUNNER",
  brand: "ADIDAS",
  sku: "HP8739",
  description: "The adidas Yeezy Foam Runner “Onyx” is a monochromatic grey colorway of Kanye West’s progressively designed hybrid slip-on sandal and sneaker that was released in June 2022. Fans who attended the listening party to Kanye’s “DONDA 2” studio album in February 2022 were given a chance to purchase the shoe ahead of its global release.",
  price: 250,
  gender: "Mens",
  released_date: "June 8, 2022",
  image: "https://img.stadiumgoods.com/18/54/99/39/18549939_43158079_2048.jpg",
)

Product.create!(
  name: "Joe Fresh Goods - Conversations Amongst Us",
  style: "550",
  brand: "NEW-BALANCE",
  sku: "BB550BH1",
  description: "The Joe Freshgoods x New Balance 550 “Conversations Among Us” is a popular collaboration between the Chicago based sneaker and streetwear designer and New Balance on the retro basketball shoe that helps tell the story of Black Americans. The “Conversations Among Us” campaign is a collaboration between Joe Freshgoods and Black Soles, a collection of Black New Balance associates that aims to shed light on the experiences of Black folks in America.",
  price: 270,
  gender: "Mens",
  released_date: "April 15, 2022",
  image: "https://img.stadiumgoods.com/18/37/57/08/18375708_43172310_2048.jpg",
)

Product.create!(
  name: "Joe Fresh Goods - INSIDE VOICES BABY SHOWER BLUE",
  style: "9060",
  brand: "NEW-BALANCE",
  sku: "U9060JG1",
  description: "The Joe Freshgoods x New Balance 9060 “Inside Voices - Baby Shower Blue” is yet another popular collaboration between the Chicago born streetwear and sneaker designer and New Balance from 2022. The New Balance 9060 is an original silhouette designed by Joe and the Boston area footwear brand, and is a sequel to the pair’s “Outside Voices” collaboration from 2021.",
  price: 349,
  gender: "Mens",
  released_date: "April 15, 2022",
  image: "https://img.stadiumgoods.com/18/51/91/08/18519108_43175181_2048.jpg",
)

Product.create!(
  name: "MADE IN USA - TEDDY SANTIS SEA SALT",
  style: "990 V#",
  brand: "NEW-BALANCE",
  sku: "M990AL3",
  description: "The Teddy Santis x New Balance 990 V3 “Made in USA” is one of several silhouettes included in the revered footwear and fashion designer’s second “Made in the USA” collection with New Balance. After being named the Creative Director of New Balance’s “Made in USA” line in April 2021, the New York native released his inaugural solo collection with the Boston-based footwear company in April 2022.",
  price: 259,
  gender: "Mens",
  released_date: "May 26, 2022",
  image: "https://img.stadiumgoods.com/18/55/62/01/18556201_43170114_2048.jpg",
)

Product.create!(
  name: "Joe Fresh Goods - INSIDE VOICES Penny Cookies Pink",
  style: "9060",
  brand: "NEW-BALANCE",
  sku: "U9060JF1",
  description: "The Joe Freshgoods x New Balance 9060 “Inside Voices - Penny Cookie Pink” is yet another popular collaboration between the Chicago born streetwear and sneaker designer and New Balance from 2022. The New Balance 9060 is an original silhouette designed by Joe and the Boston area footwear brand, and is a sequel to the pair’s “Outside Voices” collaboration from 2021.",
  price: 395,
  gender: "Mens",
  released_date: "May 20, 2022",
  image: "https://img.stadiumgoods.com/18/51/91/07/18519107_43170023_2048.jpg",
)

Product.create!(
  name: "Kith Daytona",
  style: "990 V3",
  brand: "NEW-BALANCE",
  sku: "M990KH3",
  description: "The Kith x New Balance 990 v3 “Daytona” is a special collaboration between Ronnie Fieg’s sneaker boutique and New Balance in a colorway of the lifestyle shoe that celebrates both Kith’s 10-year anniversary and the 990’s 40-year anniversary. From a four-piece collection co-designed by Kith and New Balance, the 990 V3 “Daytona” is inspired by Fieg and New Balance’s 1600 shoe of the same nickname from 2013, as it features the same color block as the now-classic release.",
  price: 230,
  gender: "Mens",
  released_date: "June 16, 2022",
  image: "https://img.stadiumgoods.com/18/68/20/77/18682077_43174568_2048.jpg",
)

Product.create!(
  name: "Aime Leon Dore White Green",
  style: "650R",
  brand: "NEW-BALANCE",
  sku: "BB650RL1",
  description: "The Aimé Leon Dore x New Balance 650R “White/Green” is one of several colorways of the retro-inspired lifestyle shoe co-designed by the New York City based clothing brand and New Balance in 2022. The Aimé Leon Dore x New Balance 650R is essentially a high-top version of the New Balance 550 silhouette that the former helped unearth back in 2020.",
  price: 269,
  gender: "Mens",
  released_date: "May 5, 2022",
  image: "https://img.stadiumgoods.com/18/48/23/50/18482350_43153652_2048.jpg",
)

Product.create!(
  name: "Kith United Arrows & Sons",
  style: "990V4",
  brand: "NEW-BALANCE",
  sku: "M990KT4",
  description: "The Kith x United Arrows and Sons x New Balance 990V4 is a collaboration between the Japanese contemporary fashion brand, Kith, and New Balance that honors both Kith’s 10-year anniversary and the 40-year anniversary of the 990. The shoe’s grey, black, purple, and pink color scheme is inspired by Kith, United Arrows, and New Balance’s previous collaboration from 2018 on the New Balance 997.",
  price: 279,
  gender: "Mens",
  released_date: "June 15, 2022",
  image: "https://img.stadiumgoods.com/18/68/03/62/18680362_43173794_2048.jpg",
)

Product.create!(
  name: "COMME des GARCONS HOMME PLUS",
  style: "997",
  brand: "NEW-BALANCE",
  sku: "MS997CG2",
  description: "The Kith x United Arrows and Sons x New Balance 990V4 is a collaboration between the Japanese contemporary fashion brand, Kith, and New Balance that honors both Kith’s 10-year anniversary and the 40-year anniversary of the 990. The shoe’s grey, black, purple, and pink color scheme is inspired by Kith, United Arrows, and New Balance’s previous collaboration from 2018 on the New Balance 997.",
  price: 1575,
  gender: "Mens",
  released_date: "April 19, 2019",
  image: "https://img.stadiumgoods.com/18/25/01/43/18250143_43080890_2048.jpg",
)


  Product.create!(
    name: "Kith Salmon Toe",
    style: "GEL-LYTE 5",
    brand: "ASICS",
    sku: "1201A542 700",
    description: "The Kith x Asics Gel-Lyte 5 “Salmon Toe” is a collaboration between Ronnie Fieg’s sneaker boutique and Asics that celebrates the former’s 10-year anniversary. The Kith x Asics Gel-Lyte 5 “Salmon Toe” is inspired by Kith and Asics’ Gel-Lyte 3 of the same nickname that was originally released in the early 2010s. The modern “Salmon Toe” features the same color block as its predecessor. Specifically, the perforated toe and forefoot overlays are designed in pink pigskin suede. The rest of the upper, including the eyelets, mid-panel, heel, and overlays, appear in navy pigskin suede. The white synthetic leather side stripes are accented with pink. A special “KXTH” logo denoting the shop’s anniversary appears on the heel while mismatched Asics and Fieg branding can be found on the left and right tongue, respectively. The shoe rides on a white foam midsole with Asics’ GEL cushioning technology in the heel.",
    price: 115,
    gender: "Mens",
    released_date: "November 26, 2021",
    image: "https://img.stadiumgoods.com/17/84/10/01/17841001_43084405_2048.jpg"
  )

Product.create!(
  name: "Mint Leaf",
  style: "GEL-LYTE 5",
  brand: "ASICS",
  sku: "H40KK 8686",
  description: "The GEL-LYTE™ V sneaker blends all-day comfort with contemporary design elements. Crafted with a premium leather upper construction, this retro running shoe puts the brand's 90s technology, like the GEL® cushioning unit and mono-sockliner on display.",
  price: 189,
  gender: "Mens",
  released_date: "April 5, 2014",
  image: "https://img.stadiumgoods.com/14/23/63/51/14236351_42944064_2048.jpg",
)

Product.create!(
  name: "Cove",
  style: "GEL-LYTE 5",
  brand: "ASICS",
  sku: "H41KK 4212",
  description: "The GEL-LYTE™ V sneaker blends all-day comfort with contemporary design elements. Crafted with a premium leather upper construction, this retro running shoe puts the brand's 90s technology, like the GEL® cushioning unit and mono-sockliner on display.",
  price: 169,
  gender: "Mens",
  released_date: "April 5, 2014",
  image: "https://img.stadiumgoods.com/14/16/47/12/14164712_42942705_2048.jpg",
)

Product.create!(
  name: "Ronnie Fieg - Super Green 2016",
  style: "GEL-LYTE 3",
  brand: "ASICS",
  sku: "H41KK 4212",
  description: "The GEL-LYTE™ iii sneaker blends all-day comfort with contemporary design elements. Crafted with a premium leather upper construction, this retro running shoe puts the brand's 90s technology, like the GEL® cushioning unit and mono-sockliner on display.",
  price: 925,
  gender: "Mens",
  released_date: "April 5, 2016",
  image: "https://img.stadiumgoods.com/14/16/47/16/14164716_42963313_2048.jpg",
)

  puts "Done!"
end
