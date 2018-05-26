class Aged_Brie_Updater
  def self.update(aged_brie)
    aged_brie.quality += 1 if aged_brie.quality < 50
  end
end