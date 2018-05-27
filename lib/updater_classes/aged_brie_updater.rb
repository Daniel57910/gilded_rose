require './lib/modules/item_sell_in'

class Aged_Brie_Updater
  extend Update_Sell_In

  def self.update(aged_brie)
    update_sell_in(aged_brie)
    aged_brie.quality += 1
  end
end