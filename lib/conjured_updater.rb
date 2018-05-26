class Conjured_Updater
  def self.update(item)
    item.quality -= 1 if item.quality > 0
    item.sell_in -= 2
  end
end