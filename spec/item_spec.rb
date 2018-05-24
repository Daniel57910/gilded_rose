require "item"
require_relative "spec_helper"
require "pry"

describe "item" do
  it "returns the name, quality and sell in date of the item" do
    item = Item.new("cherry", 10, 10)
    expect(item.name).to eq("cherry")
    expect(item.sell_in).to eq(10)
    expect(item.quality).to eq(10)
  end
end