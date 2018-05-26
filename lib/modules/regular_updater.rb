module Regular_Updater

  attr_reader :items
  def update_items(items)
    @@items = items
    update_regular_items
  end

  private

  def update_regular_items
    @@items.each do | item |
      update_item_quality(item) if item_quality_positive?(item)
      item.sell_in -= 1
    end
  end

  def item_quality_positive?(item)
    item.quality > 0
  end

  def update_item_quality(item)
    if is_expired?(item) or has_one_quality?(item)
      item.quality -= 1 
    else
      item.quality -= 2
    end
  end

  def is_expired?(item)
    item.sell_in < 0
  end

  def has_one_quality?(item)
    item.quality == 1
  end

end