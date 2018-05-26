require ("./lib/modules/item_updater_methods")

class Conjured_Updater

  extend Item_Updater_Methods

  def self.update(item)
    if !is_expired?(item) and item_quality_positive?(item) or has_one_quality?(item)
      item.quality -= 1
    elsif is_expired?(item) and item_quality_positive?(item)
      item.quality -= 2
    end
    item.sell_in -= 2
  end
end