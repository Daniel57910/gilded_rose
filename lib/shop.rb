require_relative 'name_checker'
require_relative 'regular_updater'
require_relative 'aged_brie_updater'
require_relative 'backstage_pass_updater'
require 'pry'

class Gilded_Rose

    attr_reader :items, :regular_items, :irregular_items, :sulfuras
    AGED_BRIE = "Aged Brie"

    def initialize(items)
      @items = items
      @regular_items = []
      @irregular_items = []
      @sulfuras = []
    end

    def update_quality()
      categorize_items
      update_regular_items
      @irregular_items.each do | item |
        Aged_Brie_Updater.update(item) if item.name == "Aged Brie"
        if item.quality < 50 and item.name == "backstage pass"
          Backstage_Pass_Updater.update(item)
        end
        item.sell_in = item.sell_in - 1
      end
    end


  private

  def categorize_items
    @items.each do |item|
      @regular_items.push(item) if is_regular_item?(item.name)
      @irregular_items.push(item) if !is_regular_item?(item.name) and item.name != "Sulfura, Hand of Ragnaros"
      @sulfuras.push(item) if item.name == "Sulfura, Hand of Ragnaros"
    end
  end

  def is_regular_item?(name)
   !(Name_Checker.special_products.include?(name))
  end

  def update_regular_items
    Regular_Updater.update_items(@regular_items)
  end

end

