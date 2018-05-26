require_relative 'name_checker'
require_relative 'regular_updater'
require_relative 'aged_brie_updater'
require_relative 'backstage_pass_updater'
require 'pry'

class Gilded_Rose

    attr_reader :items, :regular_items, :irregular_items, :sulfuras

    def initialize(items)
      @items = items
      @regular_items = []
      @irregular_items = []
      @sulfuras = []
    end

    def update_quality()
      categorize_items
      update_regular_items
      update_irregular_items
    end

  private

  def update_irregular_items
    @irregular_items.each do | item |
      update_aged_brie(item) if aged_brie?(item.name)
      update_backstage_pass(item) if backstage_pass?(item.name)
      update_conjured_item(item) if conjured_item?(item.name)
      update_sell_in(item)
    end
  end
  
  def categorize_items
    @items.each do |item|
      @regular_items.push(item) if is_regular_item?(item.name)
      @irregular_items.push(item) if !is_regular_item?(item.name) and !is_legendary_item(item.name)
      @sulfuras.push(item) if is_legendary_item(item.name)
    end
  end

  def is_regular_item?(name)
   !(Name_Checker.special_products.include?(name) or is_legendary_item(name) or name.include?("conjure"))
  end

  def is_legendary_item(name)
    name == "Sulfura, Hand of Ragnaros"
  end

  def update_regular_items
    Regular_Updater.update_items(@regular_items)
  end

  def update_aged_brie(item)
    Aged_Brie_Updater.update(item)
  end

  def update_backstage_pass(item)
    Backstage_Pass_Updater.update(item)
  end

  def update_sell_in(item)
    item.sell_in -= 1
  end

  def aged_brie?(name)
    name == "Aged Brie"
  end
  
  def backstage_pass?(name)
    name == "Backstage Pass"
  end

  def conjured_item?(name)
    name.include?("conjure")
  end
    

end

