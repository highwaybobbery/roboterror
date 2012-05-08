class RobotInventoriesController < ApplicationController
  respond_to :json

  def create
    @inventory = Inventory.find(params[:inventory_id])
    @robot = Robot.find(params[:robot_id])
    response_hash = {}
    response_status = nil
    if @robot.equipped_with? @inventory.equipment.equipment_type
      response_hash[:error] = "Robot already has equipment of type #{@inventory.equipment_type.name}"
    else
      @inventory.robot = @robot
      @inventory.save
      @robot_stats = @robot.calculate_stats
      response_hash[:robot] = @robot
      response_hash[:inventory] = @inventory
      response_hash[:equipment] = @inventory.equipment
      response_hash[:robot_stats] = @robot_stats
    end
    render json: response_hash
  end

  def destroy
    @inventory = Inventory.find(params[:inventory_id])
    @robot = Robot.find(params[:robot_id])
    @inventory.robot = nil
    @inventory.save
    @robot_stats = @robot.calculate_stats
    response_hash = {}
    response_hash[:robot] = @robot
    response_hash[:inventory] = @inventory
    response_hash[:equipment] = @inventory.equipment
    response_hash[:robot_stats] = @robot_stats

    render json: response_hash
  end
end
