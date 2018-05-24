require 'name_checker'
require 'pry'

describe 'Name_Checker' do
  describe Name_Checker do
    it "returns true if a special item is identified by name" do
      expect(described_class.special_products.include?("Aged Brie")).to eq true
    end
    it "returns false if a regular item is included by name" do
       expect(described_class.special_products.include?("apple")).to eq false
    end

  end
end