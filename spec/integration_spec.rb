require "./lib/shop"
require "./lib/item"
require 'pry'

describe "Integration Testing" do

  before(:each) do
    all_items = [
      Item.new("Aged Brie", -9, 49), 
      Item.new("Aged Brie", -9, 50),
      Item.new("Cherries", 5, 3),
      Item.new("Apple", -1, 1),
      Item.new("No Value", 10, 0),
      Item.new("conjure_cheese", 8, 6),
      Item.new("Sulfura, Hand of Ragnaros", 10, 10),
      Item.new("Backstage Pass", 0, 10),
      Item.new("Backstage Pass", 2, 10),
      Item.new("Backstage Pass", 7, 10),
      Item.new("Backstage Pass", 39, 15),
      Item.new("Expired Regular", -6, 5)
    ]
    @shop = Gilded_Rose.new(all_items)
    @shop.update_quality
  end

  describe" Separating Item" do
    it "separates the items into regular, irregular and legendary" do
      expect(@shop.regular_items.length).to eq 4
      expect(@shop.irregular_items.length).to eq 7
      expect(@shop.sulfuras.length).to eq 1
    end
  end

  describe "Legendary Item" do
    it "does nothing to the legendary item" do
      expect(@shop.sulfuras[0].quality).to eq 10
      expect(@shop.sulfuras[0].quality).to eq 10
    end
  end

  describe "Irregular Items" do

   describe "Aged Brie" do
      it "increases the value of aged brie while <= 50" do
        expect(@shop.items[0].quality).to eq 50
        expect(@shop.items[1].quality).to eq 50
        expect(@shop.items[0].sell_in).to eq -10
        expect(@shop.items[1].sell_in).to eq -10
      end
    end

    describe "Conjure Cheese" do
      it "decreases in sell_in twice as fast" do
        expect(@shop.items[5].quality).to eq 5
        expect(@shop.items[5].sell_in).to eq 6
      end
    end

    describe "Backstage Pass" do
      it "is worthless when the sell_in is < 0" do
        expect(@shop.items[7].quality).to eq 0
        expect(@shop.items[7].sell_in).to eq -1
      end
      it "increases by value in 3 with < 5 days" do
        expect(@shop.items[8].quality).to eq 13
        expect(@shop.items[8].sell_in).to eq 1
      end
      it "increases by value of 2 with <= 10 days" do
        expect(@shop.items[9].quality).to eq 12
        expect(@shop.items[9].sell_in).to eq 6
      end
    end

  end

  describe "Regular Items" do
    it "decreases quality by 1 if quality if positive and item is not expired" do
      expect(@shop.items[2].quality).to eq 2
      expect(@shop.items[2].sell_in).to eq 4
    end

    it "does not decrease quality to less than 0" do
      expect(@shop.items[3].quality).to eq 0
    end

    it "decreases quality by 2 if item's expired" do
      expect(@shop.items.last.quality).to eq 3
      expect(@shop.items.last.sell_in).to eq -7
    end
  end

end


  



