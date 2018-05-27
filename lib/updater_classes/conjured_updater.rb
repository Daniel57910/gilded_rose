require ("./lib/modules/item_updater_methods")
require ("./lib/modules/item_sell_in")

class Conjured_Item_Updater

  extend Item_Updater_Methods
  extend Update_Sell_In

  def self.update(item)
    2.times do update_sell_in(item) end
    if !is_expired?(item) and item_quality_positive?(item) or has_one_quality?(item)
      item.quality -= 1
    elsif is_expired?(item) and item_quality_positive?(item)
      item.quality -= 2
    end
  end
end