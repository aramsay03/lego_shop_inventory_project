require_relative( "../models/supplier.rb" )
require_relative( "../models/category.rb" )
require_relative( "../models/product.rb" )
require_relative( "../models/stock.rb" )
require("pry-byebug")

Stock.delete_all()
Product.delete_all()

## supplier Seed Data ##

supplier1 = Supplier.new({
  "company_name" => "Lego",
  "address" => "Lego, somewhere in Denmark",
  "telephone" => "+32 0004 44732",
  "email" => "sales@lego.dk",
  "sales_contact" => "Mr Lego Salesman",
  "notes" => "Minimun order value £1500.00"
})
supplier1.save()

supplier2 = Supplier.new({
  "company_name" => "Brick Links",
  "address" => "Edgware Rd, London",
  "telephone" => "02600 564 0573",
  "email" => "sales@bricklinks.co.uk",
  "sales_contact" => "Luke Skywalker",
  "notes" => "Warning slow to deliver."
})
supplier2.save()

supplier3 = Supplier.new({
  "company_name" => "Lego Clearance Market",
  "address" => "Manchester",
  "telephone" => "076854 30355",
  "email" => "sales@legoclearance.com",
  "sales_contact" => "Mr Clearance",
  "notes" => "Salesman is a nightmare to deal with."
})
supplier3.save()

## Category Seed Data ##

category1 = Category.new({
  "name" => "Technic"
})
category1.save()

category2 = Category.new({
  "name" => "Lego Starwars"
})
category2.save()

category3 = Category.new({
  "name" => "Lego City"
})
category3.save()

category4 = Category.new({
  "name" => "Lego Creator"
})
category4.save()

category5 = Category.new({
  "name" => "Lego Ideas"
})
category5.save()

## Product Seed Data ##

product1 = Product.new({
  "name" => "Mini Mobile Crane",
  "product_code" => "8067",
  "description" => "Move even the heaviest loads with the Mini Mobile Crane!",
#
# This compact mobile crane is packed with functions and hard-core hauling power! Steer it into position, then raise, lower, turn and extend the boom to lift heavy loads! Remember to extend the outriggers to stabilize it for extra big jobs! Rebuilds into a tow truck.",
  "cost_price" => 13,
  "supplier_id" => supplier2.id,
  "category_id" => category1.id
})
product1.save()

product2 = Product.new({
  "name" => "Imperial Star Destroyer",
  "product_code" => "75252",
  "description" => "Build and display an icon of the Galactic Empire",
   # – the Devastator. With over 4,700 LEGO® pieces, this Ultimate Collector Series 75252 Imperial Star Destroyer model captures all the authentic details of the starship as it appeared in the opening scene of Star Wars: A New Hope, including swiveling guns, a tilting radar dish, huge engine exhausts, intricate surface detailing and of course a buildable scale version of the Rebels' Tantive IV starship to chase down. This galactic civil war UCS set also includes a display stand with informational fact plaque and 2 Imperial minifigures, making it the perfect LEGO Star Wars collectible for discerning fans.",
  "cost_price" => 400,
  "supplier_id" => supplier1.id,
  "category_id" => category2.id
})
product2.save()

product3 = Product.new({
  "name" => "International Space Station",
  "product_code" => "21321",
  "description" => "Build and display this spectacular LEGO® Ideas 21321 ISS (International Space Station).",
  # Packed with authentic ISS details, including a posable Canadarm2 and 2 rotating joints that coincide with 8 adjustable ‘solar panels’, this 864-piece set is a wonderful gift idea for space enthusiasts, adult LEGO fans or any experienced builder. Beautiful centerpiece This awesome LEGO spaceship model comes with a display stand, a buildable mini NASA space shuttle and 3 mini cargo spacecrafts, plus 2 astronaut microfigures to create a striking centerpiece in any room. Illustrated instructions are included, plus a 148-page booklet with fascinating ISS facts and information about the LEGO fan who created this space model kit and its LEGO designer. Amazing ideas! The infinitely diverse array of LEGO Ideas sets are all created by LEGO fans and voted for by LEGO fans. Inspired by real life, action heroes, iconic movies, popular TV series or totally original concepts, there is something to delightall ages.",
  "cost_price" => 43,
  "supplier_id" => supplier1.id,
  "category_id" => category5.id
})
product3.save()

## Stock Seed Data ##

stock1 = Stock.new({
  "product_id" => product1.id,
  "retail_price" => 21,
  "stock_qty" => 10
})
stock1.save()

stock2 = Stock.new({
  "product_id" => product2.id,
  "retail_price" => 650,
  "stock_qty" => 4
})
stock2.save()

stock3 = Stock.new({
  "product_id" => product3.id,
  "retail_price" => 65,
  "stock_qty" => 8
})
stock3.save()

binding.pry
nil
