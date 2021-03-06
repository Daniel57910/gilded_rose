require './lib/modules/item_updater_methods'
require './lib/modules/item_sell_in'

class Regular_Updater

  extend Item_Updater_Methods
  extend Update_Sell_In

  attr_reader :items
  def self.update_items(items)
    @@items = items
    update_regular_items
  end

  private

  def self.update_regular_items
    @@items.each do | item |
      update_sell_in(item)
      update_item_quality(item) if item_quality_positive?(item)
    end
  end

  def self.update_item_quality(item)
    if !is_expired?(item) or has_one_quality?(item)
      item.quality -= 1 
    else
      item.quality -= 2
    end
  end

end