module Item_Updater_Methods

  def item_quality_positive?(item)
    item.quality > 0
  end

  def is_expired?(item)
    item.sell_in < 0
  end

  def has_one_quality?(item)
    item.quality == 1
  end

  def item_quality_max?(item)
    item.quality >= 50
  end

  def check_item_quality(item)
    item.quality = 50 if item_quality_max?(item)
    item.quality = 0  if item.quality < 0
  end

end