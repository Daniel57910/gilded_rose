require_relative 'spec_helper'
require 'shop'

describe Gilded_Rose do
  before(:each) do
    class Test_Item
      def initialize(name, sell_in, quality)
        @name = name
        @sell_in = sell_in
        @quality = quality
      end
    end

    @items = []
    item_1 = Test_Item.new("apple", 20, 20)
    @items.push(item_1)
    item_2 = Test_Item.new("cherry", 15, 8)
    @items.push(item_2)
    item_3 = Test_Item.new("ham", 9, 6)
    @items.push(item_3)

    @gilded_rose = described_class.new(@items)

  end

  it "returns the gilded rose pub" do
    items_in_shop = @gilded_rose.items
    expect(items_in_shop.length).to eq 3
    
  end
end


