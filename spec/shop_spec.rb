require_relative 'spec_helper'
require 'shop'
require_relative 'helper_methods'

describe Gilded_Rose do

  before(:each) do
    @items = []
  end

  describe "#initialize" do
    before(:each) do
      create_items_array
      @gilded_rose = described_class.new(@items)
      @items_in_shop = @gilded_rose.items
    end
    it "should have an array of items upon initialization" do
      expect(@items_in_shop.length).to eq 3
    end
    it "should have an array of items with name, sell in and quality" do
      expect(@items_in_shop[0].name).to eq "apple"
      expect(@items_in_shop[1].sell_in).to eq 15
      expect(@items_in_shop[2].quality).to eq 6
    end
  end

  describe "#update_quality" do
    before(:each) do
      test_special_items
      @gilded_rose = described_class.new(@items)
      @gilded_rose.update_quality
    end
    it "adds regular items to the regular item array" do
      expect(@gilded_rose.regular_items.length).to eq 3
      expect(@gilded_rose.regular_items[0].name).to eq "apple"
    end
    it "adds irregular items to the irregular item array" do
      expect(@gilded_rose.irregular_items.length).to eq 1
      expect(@gilded_rose.irregular_items[0].name).to eq "Aged Brie"
    end

    it "adds the legendary item sulfura to sulfuras array" do
      add_legendary_item
      @gilded_rose = described_class.new(@items)
      @gilded_rose.update_items
      expect(@gilded_rose.sulfuras.length).to eq 1
      expect(@gilded_rose.irregular_items.length).to eq 1
      expect(@gilded_rose.regular_items.length).to eq 3
      expect(@gilded_rose.items.length).to eq 4
    end
  end

end
