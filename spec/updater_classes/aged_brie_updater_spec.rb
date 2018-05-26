require 'helper_methods'
require 'pry'
require './lib/updater_classes/aged_brie_updater'

describe Aged_Brie_Updater do
  it "increases the quality of the item by one and decrements the sell_in" do
    aged_brie = Test_Item.new("Aged Brie", 10, 10)
    Aged_Brie_Updater.update(aged_brie)
    expect(aged_brie.quality).to eq 11
  end
  
end
