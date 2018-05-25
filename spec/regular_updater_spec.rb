require 'regular_updater'
require_relative 'helper_methods'

describe Regular_Updater do

  describe "#update_items" do
    it "should decrement the quality and sell in date of the items by one" do
      @items = []
      create_items_array
      expect(@items[0].quality).to eq 20
      expect(@items[0].sell_in).to eq 20
      Regular_Updater.update_items(@items)
      expect(@items[0].quality).to eq 19
      expect(@items[0].sell_in).to eq 19
    end
  end

end

