require_relative 'shop'
require_relative 'item'

all_items = [
  Item.new("Aged Brie", -9, 49), 
  Item.new("Aged Brie", -9, 50),
  Item.new("Cherries", 5, 3),
  Item.new("Apple", -1, 1),
  Item.new("No Value", 10, 0),
  Item.new("conjure_cheese", 8, 6),
  Item.new("Sulfura, Hand of Ragnaros", 10, 10),
  Item.new("Backstage Pass", 0, 10),
  Item.new("Backstage Pass", 2, 10),
  Item.new("Backstage Pass", 2, 10),
  Item.new("Backstage Pass", 39, 15)
]

shop = Gilded_Rose.new(all_items)
puts "\n\n"
puts "Item Name | Sell_In | Quality"
puts "\nBefore Update: \n"
puts shop.items
shop.update_quality
puts "\nAfter 1st Update: \n"
puts shop.items
puts "\nAfter 2nd Update: \n"
shop.update_quality
puts shop.items 
puts "\nAfter 3rd Update: \n"
shop.update_quality
puts shop.items

