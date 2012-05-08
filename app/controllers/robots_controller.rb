class RobotsController < ApplicationController
  def show
    @robot = Robot.find(params[:id])
  end

  def new
    @robot = Robot.new
  end

  def create
    @robot = Robot.new(params[:robot])
    current_user.robots << @robot

    if @robot.save
      redirect_to edit_robot_path(@robot)
    else
      render :new
    end
  end

  def edit
    @robot = Robot.find(params[:id])
    @robot_stats = @robot.calculate_stats
    @stats = Stat.all
    @equipment_types = EquipmentType.all
    @inventories = current_user.inventories
  end

  def update
    @robot = Robot.find(params[:id])
    @robot.update_attributes params[:robot]
    redirect_to root_path
  end

  def destroy
    @robot = Robot.find(params[:id])
    @robot.delete
    redirect_to root_path
  end
end
