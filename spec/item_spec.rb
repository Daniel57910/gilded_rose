require "item"
require_relative "spec_helper"
require "pry"

describe "item" do

  before(:each) do
     @item = Item.new("cherry", 10, 10)
  end
  it "returns the name, quality and sell in date of the item" do
    #item = Item.new("cherry", 10, 10)
    expect(@item.name).to eq("cherry")
    expect(@item.sell_in).to eq(10)
    expect(@item.quality).to eq(10)
  end

  describe "#to_s" do
    it "returns in string format the name, sell in and quality of the item" do
      expect(@item.to_s).to eq("cherry, 10, 10")
    end
  end
end