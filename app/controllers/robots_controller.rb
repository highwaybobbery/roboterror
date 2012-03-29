class RobotsController < ApplicationController
  def new
    @robot = Robot.new
  end

  def create
    @robot = Robot.new(params[:robot])
    if @robot.save
      redirect_to root_path
    else
      render :new
    end

  end
end
