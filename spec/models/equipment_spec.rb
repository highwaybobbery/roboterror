require 'spec_helper'

describe Equipment do
  # Database
  it { should have_db_column(:created_at) }
  it { should have_db_column(:updated_at) }

  # Attributes
  it{ should allow_mass_assignment_of(:name) }
  it{ should allow_mass_assignment_of(:equipment_type_id) }
  it{ should allow_mass_assignment_of(:chassis_id) }

  # Associations
  it{ should have_many(:inventories).dependent(:destroy) }
  it{ should have_many(:users).through(:inventories) }
  it{ should have_many(:equipment_stats).dependent(:destroy) }
  it{ should belong_to(:chassis) }
  it{ should belong_to(:equipment_type) }

  # Validations
  it{ should validate_presence_of(:name) }
  it{ should validate_presence_of(:chassis) }
  it{ should validate_presence_of(:equipment_type) }

  describe "instance methods" do
    before do
      @stat1 = create(:stat, name: 'spunk', price: 3, price_growth: 0.5)
      @stat2 = create(:stat, name: 'redness', price: 5, price_growth: 0.75)
      @equipment = create(:equipment)
    end

    describe "#calculate_price" do
      it "should set the price of the equipment before validation" do
        @equipment.price.should == 0
        @equipment_stat1 = create(:equipment_stat, modifier: 3, stat: @stat1, equipment: @equipment)
        @equipment_stat1.price.should == 30
        @equipment.price.should == 30
        @equipment_stat2 = create(:equipment_stat, modifier: 4, stat: @stat2, equipment: @equipment)
        @equipment_stat2.price.should == 184
        @equipment.price.should == 214
      end
    end

    describe "#calculate_stats" do
      it "should return a hash of all stats" do
        create(:equipment_stat, modifier: 3, stat: @stat1, equipment: @equipment)
        create(:equipment_stat, modifier: 4, stat: @stat2, equipment: @equipment)
        @equipment.calculate_stats.should == { spunk: 3, redness: 4 }
      end
    end
  end
end
