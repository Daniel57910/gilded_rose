module Item_Updater

  def update_regular_items
    Regular_Updater.update_items(@regular_items)
  end

  def update_aged_brie(item)
    Aged_Brie_Updater.update(item)
  end

  def update_backstage_pass(item)
    Backstage_Pass_Updater.update(item)
  end

  def update_conjured_item(item)
    Conjured_Item_Updater.update(item)
  end

end