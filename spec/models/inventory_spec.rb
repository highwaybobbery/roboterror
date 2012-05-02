require 'spec_helper'

describe Inventory do
  # Database
  it { should have_db_column(:created_at) }
  it { should have_db_column(:updated_at) }

  # Assignment
  it{ should allow_mass_assignment_of(:equipment_id) }

  # Validations
  it{ should validate_presence_of(:user) }
  it{ should validate_presence_of(:equipment) }

  # Associations
  it{ should belong_to :user }
  it{ should belong_to :equipment }
  it{ should belong_to :robot }

  describe "#unassigned" do
    before do
      @user = create(:user)
      @robot = create(:robot, user: @user)
      @inventory1 = create(:inventory, robot: @robot, user: @user)
      @inventory2 = create(:inventory, user: @user)
      @inventory3 = create(:inventory)
    end

    it "should return the inventories that are not assigned to a robot" do
      @user.inventories.unassigned.should == [@inventory2]
    end
  end
end
