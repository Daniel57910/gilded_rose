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

  def test_special_items
    create_items_array
    special_item = Test_Item.new("Aged Brie", 20, 10)
    @items.push(special_item)
  end

  def add_expired_item
    create_items_array
    expired_item = Test_Item.new("chocolate", -5, 0)
    @items.push(expired_item)
  end

  def add_expired_item_with_quality
    create_items_array
    expired_item_with_quality = Test_Item.new("bananas", -3, 3)
    @items.push(expired_item_with_quality)
  end

  def add_backstage_passes
    @pass_1 = Test_Item.new("backstage", 13, 10)
    @pass_2 = Test_Item.new("backstage", 6, 10)
    @pass_3 = Test_Item.new("backstage", 3, 10)
    @pass_4 = Test_Item.new("backstage", -3, 10)
  end

  def add_legendary_item
    test_special_items
    sulfura = Test_Item.new("Sulfura, Hand of Ragnaros", 10, 10)
    @items.push(sulfura)
  end
