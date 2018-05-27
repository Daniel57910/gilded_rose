module Name_Checker 
  SPECIAL_ITEMS = ["Aged Brie", "Backstage Pass"]
  
  def self.special_products
    SPECIAL_ITEMS
  end

  def is_regular_item?(name)
   !(Name_Checker.special_products.include?(name) or is_legendary_item(name) or is_conjured_item?(name))
  end

  def is_conjured_item?(name)
    name.include?("conjure")
  end

  def is_legendary_item(name)
    name == "Sulfura, Hand of Ragnaros"
  end

  def aged_brie?(name)
    name == "Aged Brie"
  end
  
  def backstage_pass?(name)
    name == "Backstage Pass"
  end

end