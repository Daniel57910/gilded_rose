require ("./lib/modules/item_updater_methods")

class Backstage_Pass_Updater

  extend Item_Updater_Methods

  def self.update(pass)
    pass.quality += 1 if pass.sell_in > 10
    pass.quality += 2 if pass.sell_in > 5 and pass.sell_in <= 10
    pass.quality += 3 if pass.sell_in >= 0 and pass.sell_in <=5
    pass.quality = 0 if is_expired?(pass)
  end

end