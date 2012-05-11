require 'spec_helper'

describe Robot do
  # Database
  it { should have_db_column(:created_at) }
  it { should have_db_column(:updated_at) }
  it { should have_db_column(:won) }
  it { should have_db_column(:lost) }

  # Attributes
  it { should allow_mass_assignment_of(:name) }

  # Associations
  it { should belong_to(:user) }
  it { should have_many(:inventories) }
  it { should have_many(:equipments).through(:inventories) }

  # Validations
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user) }

  describe "#calculate_price" do
    before do
      @robot = build_stubbed(:robot)
      @equipment = create(:equipment_stat).equipment
      @inventory = create(:inventory, robot:  @robot, equipment: @equipment)
    end

    it "should have the correct price" do
      @robot.calculate_price.should == 1
    end
  end

  describe "#calculate_stats" do
    before do
      @robot = build_stubbed(:robot)

      @health = create(:stat, name: 'health')
      @strength = create(:stat, name: 'strength')
      @speed = create(:stat, name: 'speed')

      @equipment1 = create(:equipment)
      @equipment2 = create(:equipment)
      @equipment3 = create(:equipment)

      create(:equipment_stat, stat: @health, modifier:10, equipment: @equipment1)
      create(:equipment_stat, stat: @strength, modifier:10, equipment: @equipment1)
      create(:equipment_stat, stat: @health, modifier:10, equipment: @equipment2)
      create(:equipment_stat, stat: @strength, modifier:-1, equipment: @equipment2)
      create(:equipment_stat, stat: @health, modifier:10, equipment: @equipment3)
      create(:equipment_stat, stat: @speed, modifier:10, equipment: @equipment3)

      @inventory1 = create(:inventory, equipment: @equipment1, robot: @robot)
      @inventory2 = create(:inventory, equipment: @equipment2, robot: @robot)
      @inventory3 = create(:inventory, equipment: @equipment3, robot: @robot)
    end

    it "returns a hash combining the stats of all equipment" do
      @robot.calculate_stats.should == {@health.id => 30, @strength.id =>  9, @speed.id => 10}
    end
  end

  describe "#euipped_with?" do
    let(:type) { create(:equipment_type) }
    let(:equipment) { create(:equipment, equipment_type: type) }
    let(:robot) { create(:robot) }

    context "with no equipment" do
      it "should return false" do
        robot.equipped_with?(type).should == false
      end
    end

    context "with equipment of type" do
      before do
        @inventory = create(:inventory, equipment: equipment, robot: robot)
      end

      it "should return true" do
        robot.equipped_with?(type).should == true
      end
    end
  end

  describe ".not_owned_by" do
    let(:user) { build_stubbed(:user) }
    let(:robot) { create(:robot, user: user) }
    let(:other_user) { build_stubbed(:user) }
    let(:other_robot) { create(:robot, user: other_user) }

    it "should only return the robot not owned by the user" do
      robots = Robot.not_owned_by(user)
      robots.should include(other_robot)
      robots.should_not include(robot)
    end
  end
end
