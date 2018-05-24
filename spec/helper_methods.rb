


  class Test_Item
    attr_accessor :name, :sell_in, :quality
    def initialize(name, sell_in, quality)
      @name = name
      @sell_in = sell_in
      @quality = quality
    end
  end

  def create_items_array
    item_1 = Test_Item.new("apple", 20, 20)
    @items.push(item_1)
    item_2 = Test_Item.new("cherry", 15, 8)
    @items.push(item_2)
    item_3 = Test_Item.new("ham", 9, 6)
    @items.push(item_3)
  end
