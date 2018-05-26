require_relative 'helper_methods'
require './lib/updater_classes/backstage_pass_updater'

require 'pry'

describe Backstage_Pass_Updater do

  before(:each) do
    add_backstage_passes
  end

  it "increases the quality by one if sell_in > 10" do
    Backstage_Pass_Updater.update(@pass_1)
    expect(@pass_1.quality).to eq 11
  end

  it "increases the quality by two if sell_in > 5 and <= 10" do
    Backstage_Pass_Updater.update(@pass_2)
    expect(@pass_2.quality).to eq 12
  end

  it "increases the quality by three if sell_in <= 5 and >= 0" do
    Backstage_Pass_Updater.update(@pass_3)
    expect(@pass_3.quality).to eq 13
  end

  it "drops the quality by 0 if the pass sell_in < 0" do
    Backstage_Pass_Updater.update(@pass_4)
    expect(@pass_4.quality).to eq 0
  end

end