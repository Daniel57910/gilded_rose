class Regular_Updater

  attr_reader :items
  def self.update_items(items)
    @@items = items
    update_regular_items
  end

  private

  def self.update_regular_items
    @@items.each do | item |
      update_item_quality(item) if item_quality_positive?(item)
      item.sell_in -= 1
    end
  end

  def self.item_quality_positive?(item)
    item.quality > 0
  end

  def self.update_item_quality(item)
    item.quality -= 1 if !is_expired?(item) || item.quality == 1
    item.quality -= 2 if is_expired?(item)
  end

  def self.is_expired?(item)
    item.sell_in < 0
  end


end