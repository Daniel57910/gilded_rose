let item = require("../src/itemClass.js");

describe("Item", function() {

  describe("Assigning values to the item", function() {
    it("should return the correct name, quality and value of the item", function() {
      item = new item.testItem("Cherries", 10, 10);
      expect(item.name).toEqual("Cherries");
      expect(item.sellIn).toEqual(10);
      expect(item.quality).toEqual(10);

    });
  });

});