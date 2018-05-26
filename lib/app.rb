require_relative 'shop'
require_relative 'item'
require 'pry'

item1 = Item.new("apple", 10, 10)
item2 = Item.new("Aged Brie", 10, 10)
item3 = Item.new("banana", 0, 1)
items = []
items.push(item1).push(item2).push(item3)
shop = Gilded_Rose.new(items)
shop.items
shop.update_quality
binding.pry
