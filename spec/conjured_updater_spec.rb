require_relative 'spec_helper'
require 'conjured_updater'
require_relative 'helper_methods'

describe Conjured_Updater do
  it "decrements the quality of the conjured_item by one" do
    test_item = Test_Item.new("conjured_cheese", 10, 10)
    Conjured_Updater.update(test_item)
    expect(test_item.quality).to eq 9
    expect(test_item.sell_in).to eq 8
  end
end