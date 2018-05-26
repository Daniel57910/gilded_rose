require './lib/modules/all_modules'
require './lib/updater_classes/updater'

class Gilded_Rose

    include Name_Checker
    include Item_Updater_Methods
    include Irregular_Item_Updater

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
      item_quality_checker
    end

  private

  def item_quality_checker 
    @items.each do |item | check_item_quality(item) end
  end

  def update_regular_items
    Regular_Updater.update_items(@regular_items)
  end

  def update_irregular_items
    @irregular_items.each do | item |
      update_aged_brie(item) if aged_brie?(item.name)
      update_backstage_pass(item) if backstage_pass?(item.name)
      update_conjured_item(item) if is_conjured_item?(item.name)
    end
  end
  
  def categorize_items
    @items.each do |item|
      @regular_items.push(item) if is_regular_item?(item.name)
      @irregular_items.push(item) if !is_regular_item?(item.name) and !is_legendary_item(item.name)
      @sulfuras.push(item) if is_legendary_item(item.name)
    end
  end

  def update_sell_in(item)
    item.sell_in -= 1
  end

end

