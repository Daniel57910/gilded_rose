class Regular_Updater

  attr_reader :items
  def self.update_items(items)
    @@items = items
    update_regular_items
  end

  private

  def self.update_regular_items
    @@items.each do | item |
      item.quality -= 1 if item.quality > 0
      item.sell_in -= 1
    end
  end


end