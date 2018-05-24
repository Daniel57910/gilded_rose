require_relative 'spec_helper'
require 'shop'

describe Gilded_Rose do
  before(:each) do
    class Test_Item

      attr_accessor :name, :sell_in, :quality
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

  describe "#initialize" do
    it "should have an array of items upon initialization" do
      items_in_shop = @gilded_rose.items
      expect(items_in_shop.length).to eq 3
    end
    it "should have an array of items with name, sell in and quality" do
      items_in_shop = @gilded_rose.items
      binding.pry
      expect(items_in_shop[0].name).to eq "apple"
      expect(items_in_shop[1].sell_in).to eq 15
      expect(items_in_shop[2].quality).to eq 6
    end
  end
end


