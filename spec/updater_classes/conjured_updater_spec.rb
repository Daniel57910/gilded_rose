require './lib/updater_classes/conjured_updater'
require 'helper_methods'

describe Conjured_Item_Updater do
  it "decrements the quality of the conjured_item by one" do
    test_item = Test_Item.new("conjured_cheese", 10, 10)
    Conjured_Item_Updater.update(test_item)
    expect(test_item.quality).to eq 9
    expect(test_item.sell_in).to eq 8
  end
end
