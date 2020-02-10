require_relative( "../models/product.rb" )
require_relative( "../models/stock.rb" )
require("pry-byebug")

Stock.delete_all()
Product.delete_all()

## supplier Seed Data ##

## Category Seed Data ##

## Product Seed Data ##

product1 = Product.new({
  "name" => "Mini Mobile Crane",
  "product_code" => "8067",
  "description" => "Move even the heaviest loads with the Mini Mobile Crane!",
#
# This compact mobile crane is packed with functions and hard-core hauling power! Steer it into position, then raise, lower, turn and extend the boom to lift heavy loads! Remember to extend the outriggers to stabilize it for extra big jobs! Rebuilds into a tow truck.",
  "cost_price" => 13
  # "supplier_id" => supplier?.id,
  # "category_id" => category?.id
})
product1.save()

product2 = Product.new({
  "name" => "Imperial Star Destroyer",
  "product_code" => "75252",
  "description" => "Build and display an icon of the Galactic Empire",
   # – the Devastator. With over 4,700 LEGO® pieces, this Ultimate Collector Series 75252 Imperial Star Destroyer model captures all the authentic details of the starship as it appeared in the opening scene of Star Wars: A New Hope, including swiveling guns, a tilting radar dish, huge engine exhausts, intricate surface detailing and of course a buildable scale version of the Rebels' Tantive IV starship to chase down. This galactic civil war UCS set also includes a display stand with informational fact plaque and 2 Imperial minifigures, making it the perfect LEGO Star Wars collectible for discerning fans.",
  "cost_price" => 400
  # "supplier_id" => supplier?.id,
  # "category_id" => category?.id
})
product2.save()

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

binding.pry
nil
