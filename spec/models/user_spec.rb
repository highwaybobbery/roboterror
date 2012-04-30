require 'spec_helper'

describe User do
  # Associations
  it { should have_many(:equipment).through(:inventories) }
  it { should have_many(:inventories).dependent(:destroy) }
  it { should have_many(:robots).dependent(:destroy) }

  # Validations
  it { should allow_value(nil).for(:balance) }
  it { should allow_value(1).for(:balance) }
  it { should allow_value(0).for(:balance) }
  it { should_not allow_value(-1).for(:balance) }

  context "purchases Equipment" do
    before do
      @user = FactoryGirl.create(:user, :balance => 1000)
    end

    context "that is affordable" do
      before do
        @equipment = FactoryGirl.create(:equipment, :price => 500)
      end

      it "should spend money" do
        @user.spend(@equipment.price)
        @user.balance.should == 500
      end
    end
  end
end
