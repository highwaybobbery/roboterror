require 'spec_helper'

describe EquipmentStat do
  # Database
  it { should have_db_column(:created_at) }
  it { should have_db_column(:updated_at) }

  # Assignment
  it{ should allow_mass_assignment_of(:stat_id) }
  it{ should allow_mass_assignment_of(:equipment_id) }
  it{ should allow_mass_assignment_of(:modifier) }

  # Associations
  it{ should belong_to(:stat) }
  it{ should belong_to(:equipment) }

  # Validations
  it{ should validate_presence_of(:stat_id) }
  it{ should validate_presence_of(:equipment_id) }
  it{ should validate_presence_of(:modifier) }

  describe "#get_price" do
    before do
      @stat = create(:stat, price: 3, price_growth: 0.5)
      @equipment = create(:equipment)
      @equipment_stat = create(:equipment_stat, modifier: 3, stat: @stat, equipment: @equipment)
    end

    it "should get the price for the stat" do
      @equipment_stat.price.should == 30
    end
  end

  describe "#as_json" do
    before do
      @stat = create(:stat, price: 3, price_growth: 0.5)
      @equipment = create(:equipment)
      @equipment_stat = create(:equipment_stat, modifier: 3, stat: @stat, equipment: @equipment)
    end

    it "should have the right elements" do
      json = @equipment_stat.as_json
      json.should include 'id'
      json.should include 'stat_id'
      json.should include 'stat_name'
      json.should include 'equipment_id'
      json.should include 'modifier'
      json.should include 'price'
    end
  end
end
