require './lib/modules/item_sell_in'

class Aged_Brie_Updater
  extend Update_Sell_In

  def self.update(aged_brie)
    aged_brie.quality += 1 if aged_brie.quality < 50
    update_sell_in(aged_brie)
  end
end