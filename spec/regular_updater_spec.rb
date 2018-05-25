require 'regular_updater'
require_relative 'helper_methods'
require 'pry'

describe Regular_Updater do

  before(:each) do
    @items = []
  end

  describe "#update_items" do
    it "should decrement the quality and sell in date of the items by one" do
      create_items_array
      expect(@items[0].quality).to eq 20
      expect(@items[0].sell_in).to eq 20
      Regular_Updater.update_items(@items)
      expect(@items[0].quality).to eq 19
      expect(@items[0].sell_in).to eq 19
    end

    it "should not decrement the quality if the quality is > 0 " do
      add_expired_item
      expired_item_sell_in = @items.last.sell_in
      expired_item_quality = @items.last.quality
      Regular_Updater.update_items(@items)
      expect(@items.last.sell_in).to eq expired_item_sell_in - 1
      expect(@items.last.quality).to eq expired_item_quality
    end
  end

end

