require 'spec_helper'

describe Stat do
  #Database
  it { should have_db_column(:created_at) }
  it { should have_db_column(:updated_at) }
  it { should have_db_column(:name) }
  it { should have_db_column(:price) }
  it { should have_db_column(:price_growth) }

  #Validation
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:price_growth) }

  describe '#get_price_for' do
    before do
     @stat1 = create(:stat, price: 2, price_growth: 0)
     @stat2 = create(:stat, price: 3, price_growth: 0.5)
    end

    context 'with an modifier of 1' do
      it "should calculate the price " do
        @stat1.get_price_for(1).should == 2
        @stat2.get_price_for(1).should == 3
      end
    end
    context 'with an modifier of 3' do
      it "should calculate the price " do
        @stat1.get_price_for(3).should == 6
        @stat2.get_price_for(3).should == 30
      end
    end

    context 'with a modifier of 0' do
      it "should calculate the price" do
        @stat1.get_price_for(0).should == 0
        @stat2.get_price_for(0).should == 0
      end
    end

    context 'with a modifier of -1' do
      it "should calculate the price" do
        @stat1.get_price_for(-1).should == -2
        @stat2.get_price_for(-1).should == -3
      end
    end

    context 'with a modifier of -3' do
      it "should calculate the price" do
        @stat1.get_price_for(-3).should == -6
        @stat2.get_price_for(-3).should == -30
      end
    end

  end
end
