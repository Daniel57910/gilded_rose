require_relative 'spec_helper'
require 'shop'
require_relative 'helper_methods'

describe Gilded_Rose do
  before(:each) do
    @items = []
    create_items_array
    @gilded_rose = described_class.new(@items)
    binding.pry
  end

  describe "#initialize" do
    before(:each) do
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
end


