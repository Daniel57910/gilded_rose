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
      Item.new("Backstage Pass", 2, 10),
      Item.new("Backstage Pass", 39, 15)
    ]
    @shop = Gilded_Rose.new(all_items)
  end

  describe" Separating Item" do
    it "separates the items into regular, irregular and legendary" do
      @shop.update_quality
      expect(@shop.regular_items.length).to eq 3
      expect(@shop.irregular_items.length).to eq 7
      expect(@shop.sulfuras.length).to eq 1
    end
  end
end


  



