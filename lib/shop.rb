require_relative 'name_checker'
require 'pry'

class Gilded_Rose

    attr_reader :items, :regular_items, :irregular_items
    #include Name_Checker

    def initialize(items)
      @items = items
      @regular_items = []
      @irregular_items = []
    end

    def update_quality()
      categorize_items
       @regular_items.each do | regular_item |
        regular_item.quality-=1 if regular_item.quality > 0
        regular_item.sell_in-=1 if regular_item.sell_in > 0
      end
    end

  private

  def categorize_items
    @items.each do |item|
      @regular_items.push(item) if is_regular_item?(item.name)
      @irregular_items.push(item) if !is_regular_item?(item.name)
    end
  end

  def is_regular_item?(name)
   !(Name_Checker.special_products.include?(name))
  end

end



=begin   
          if item.name != "Sulfuras, Hand of Ragnaros"
            item.quality = item.quality - 1
          end    if item.quality > 0

        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
    end
  end
=end
  

